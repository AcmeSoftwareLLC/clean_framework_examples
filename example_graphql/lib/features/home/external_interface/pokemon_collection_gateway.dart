import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/core/pokemon/pokemon_failure_response.dart';
import 'package:clean_framework_example_graphql/core/pokemon/pokemon_request.dart';
import 'package:clean_framework_example_graphql/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework_example_graphql/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';

class PokemonCollectionGateway extends Gateway<
    PokemonCollectionDomainToGatewayModel,
    PokemonCollectionQueryRequest,
    GraphQLSuccessResponse,
    PokemonCollectionSuccessDomainInput> {
  @override
  PokemonCollectionQueryRequest buildRequest(
      PokemonCollectionDomainToGatewayModel domainModel) {
    return PokemonCollectionQueryRequest();
  }

  @override
  PokemonCollectionFailureDomainInput onFailure(
    PokemonFailureResponse failureResponse,
  ) {
    return PokemonCollectionFailureDomainInput(
      message: failureResponse.message,
      type: failureResponse.type,
    );
  }

  @override
  PokemonCollectionSuccessDomainInput onSuccess(
      GraphQLSuccessResponse response) {
    final deserializer = Deserializer(response.data);

    return PokemonCollectionSuccessDomainInput(
      pokemonIdentities: deserializer.getList(
        'pokemon_v2_pokemon',
        converter: PokemonIdentity.fromJson,
      ),
    );
  }
}

class PokemonCollectionQueryRequest extends PokemonQueryRequest {
  @override
  String get document => '''
  query pokemonQuery(\$limit: Int) {
    pokemon_v2_pokemon(limit: \$limit) {
      id
      name
    }
  }
  ''';

  @override
  Map<String, dynamic> get variables => {
        'limit': 1000,
      };
}
