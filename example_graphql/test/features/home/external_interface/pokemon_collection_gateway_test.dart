import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_example_graphql/features/home/external_interface/pokemon_collection_gateway.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonCollectionGateway tests |', () {
    test('verify request', () async {
      final gateway = PokemonCollectionGateway();
      final gatewayOutput = PokemonCollectionDomainToGatewayModel();

      final request = await gateway.buildRequest(gatewayOutput);

      expect(request.document, equals('''
  query pokemonQuery {
    pokemon_v2_pokemon(limit: 1000) {
      id
      name
    }
  }
  '''));
      expect(request.variables, equals({}));

      expect(gatewayOutput, PokemonCollectionDomainToGatewayModel());
    });

    test('success', () async {
      final gateway = PokemonCollectionGateway()
        ..feedResponse(
          (request) async => Either.right(
            GraphQLSuccessResponse(
              data: {
                "pokemon_v2_pokemon": [
                  {"id": 1, "name": "bulbasaur"},
                  {"id": 2, "name": "ivysaur"},
                ],
              },
            ),
          ),
        );

      final input =
          await gateway.buildInput(PokemonCollectionDomainToGatewayModel());

      expect(input.isRight, isTrue);

      final identities = input.right.pokemonIdentities;

      expect(identities.first.name, equals('bulbasaur'));
      expect(identities.first.id, equals('1'));

      expect(identities.last.name, equals('ivysaur'));
      expect(identities.last.id, equals('2'));
    });

    test('failure', () async {
      final gateway = PokemonCollectionGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input =
          await gateway.buildInput(PokemonCollectionDomainToGatewayModel());

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
