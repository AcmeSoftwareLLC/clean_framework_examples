import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/core/pokemon/pokemon_request.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_inputs.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_example_graphql/features/profile/models/pokemon_profile_model.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';

class PokemonProfileGateway extends Gateway<
    PokemonProfileDomainToGatewayModel,
    PokemonProfileQueryRequest,
    GraphQLSuccessResponse,
    PokemonProfileSuccessInput> {
  @override
  PokemonProfileQueryRequest buildRequest(
      PokemonProfileDomainToGatewayModel domainModel) {
    return PokemonProfileQueryRequest(name: domainModel.name);
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }

  @override
  PokemonProfileSuccessInput onSuccess(GraphQLSuccessResponse response) {
    return PokemonProfileSuccessInput(
      profile: PokemonProfileModel.fromJson(
        response.data['pokemon_v2_pokemon'][0],
      ),
    );
  }
}

class PokemonProfileQueryRequest extends PokemonQueryRequest {
  PokemonProfileQueryRequest({required this.name});

  final String name;

  @override
  String get document => '''
  query pokemonProfileQuery(\$name: String) {
    pokemon_v2_pokemon(where: {name: {_eq: \$name}}) {
      base_experience
      height
      weight
      pokemon_v2_pokemonstats
      {
        pokemon_v2_stat
        {
          name
        }
        base_stat
      }
      pokemon_v2_pokemontypes
      {
        pokemon_v2_type
        {
          name
        }
      }
    }
  }
  ''';

  @override
  Map<String, dynamic> get variables => {
        'name': name,
      };
}
