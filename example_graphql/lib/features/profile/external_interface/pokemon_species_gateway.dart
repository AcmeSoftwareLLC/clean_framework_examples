import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/core/pokemon/pokemon_request.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_inputs.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_example_graphql/features/profile/models/pokemon_species_model.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';

class PokemonSpeciesGateway extends Gateway<
    PokemonSpeciesDomainToGatewayModel,
    PokemonSpeciesQueryRequest,
    GraphQLSuccessResponse,
    PokemonSpeciesSuccessDomainInput> {
  @override
  PokemonSpeciesQueryRequest buildRequest(
      PokemonSpeciesDomainToGatewayModel domainModel) {
    return PokemonSpeciesQueryRequest(name: domainModel.name);
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }

  @override
  PokemonSpeciesSuccessDomainInput onSuccess(GraphQLSuccessResponse response) {
    return PokemonSpeciesSuccessDomainInput(
      species: PokemonSpeciesModel.fromJson(
        response.data['pokemon_v2_pokemonspecies'][0],
      ),
    );
  }
}

class PokemonSpeciesQueryRequest extends PokemonQueryRequest {
  PokemonSpeciesQueryRequest({required this.name});

  final String name;

  @override
  String get document => '''
  query pokemonSpeciesQuery(\$name: String) {
    pokemon_v2_pokemonspecies(where: {name: {_eq: \$name}}) {
      pokemon_v2_pokemonspeciesflavortexts
      {
        flavor_text
        pokemon_v2_language
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
