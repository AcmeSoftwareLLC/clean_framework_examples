import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_example_graphql/features/profile/external_interface/pokemon_species_gateway.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonSpeciesGateway tests |', () {
    test(
      'verify request',
      () async {
        final gateway = PokemonSpeciesGateway();
        final gatewayOutput =
            PokemonSpeciesDomainToGatewayModel(name: 'pikachu');

        final request = await gateway.buildRequest(gatewayOutput);

        expect(request.document, equals('''
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
  '''));
        expect(
          request.variables,
          equals(
            {
              'name': 'pikachu',
            },
          ),
        );

        expect(
            gatewayOutput, PokemonSpeciesDomainToGatewayModel(name: 'pikachu'));
      },
    );

    test('success', () async {
      final gateway = PokemonSpeciesGateway()
        ..feedResponse(
          (request) async => Either.right(
            GraphQLSuccessResponse(
              data: {
                'flavor_text_entries': [
                  {
                    'flavor_text':
                        'It keeps its tail\nraised to monitor\nits surroundings.\fIf you yank its\ntail, it will try\nto bite you.',
                    'language': {
                      'name': 'en',
                      'url': 'https://pokeapi.co/api/v2/language/9/',
                    },
                    'version': {
                      'name': 'yellow',
                      'url': 'https://pokeapi.co/api/v2/version/3/',
                    }
                  },
                  {
                    'flavor_text':
                        'This intelligent\nPOKéMON roasts\nhard BERRIES with\felectricity to\nmake them tender\nenough to eat.',
                    'language': {
                      'name': 'en',
                      'url': 'https://pokeapi.co/api/v2/language/9/',
                    },
                    'version': {
                      'name': 'gold',
                      'url': 'https://pokeapi.co/api/v2/version/4/',
                    }
                  },
                ],
              },
            ),
          ),
        );

      final input = await gateway.buildInput(
        PokemonSpeciesDomainToGatewayModel(name: 'pikachu'),
      );

      expect(input.isRight, isTrue);

      final descriptions = input.right.species.descriptions;

      expect(
        descriptions.map((d) => d.text),
        equals(
          [
            'It keeps its tail\nraised to monitor\nits surroundings.\fIf you yank its\ntail, it will try\nto bite you.',
            'This intelligent\nPOKéMON roasts\nhard BERRIES with\felectricity to\nmake them tender\nenough to eat.',
          ],
        ),
      );
    });

    test('failure', () async {
      final gateway = PokemonSpeciesGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input = await gateway.buildInput(
        PokemonSpeciesDomainToGatewayModel(name: 'pikachu'),
      );

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
