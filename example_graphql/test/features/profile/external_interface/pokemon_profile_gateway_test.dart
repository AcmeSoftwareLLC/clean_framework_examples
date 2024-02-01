import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_example_graphql/features/profile/external_interface/pokemon_profile_gateway.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonProfileGateway tests |', () {
    test('verify request', () async {
      final gateway = PokemonProfileGateway();
      final gatewayOutput = PokemonProfileDomainToGatewayModel(name: 'pikachu');

      final request = await gateway.buildRequest(gatewayOutput);

      expect(request.document, equals('''
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
  '''));

      expect(
          gatewayOutput, PokemonProfileDomainToGatewayModel(name: 'pikachu'));
    });

    test('success', () async {
      final gateway = PokemonProfileGateway()
        ..feedResponse(
          (request) async => Either.right(
            GraphQLSuccessResponse(
              data: {
                "pokemon_v2_pokemon": [
                  {
                    "base_experience": 142,
                    "height": 10,
                    "weight": 130,
                    "pokemon_v2_pokemonstats": [
                      {
                        "pokemon_v2_stat": {"name": "hp"},
                        "base_stat": 60
                      },
                      {
                        "pokemon_v2_stat": {"name": "attack"},
                        "base_stat": 62
                      },
                      {
                        "pokemon_v2_stat": {"name": "defense"},
                        "base_stat": 63
                      },
                      {
                        "pokemon_v2_stat": {"name": "special-attack"},
                        "base_stat": 80
                      },
                      {
                        "pokemon_v2_stat": {"name": "special-defense"},
                        "base_stat": 80
                      },
                      {
                        "pokemon_v2_stat": {"name": "speed"},
                        "base_stat": 60
                      }
                    ],
                    "pokemon_v2_pokemontypes": [
                      {
                        "pokemon_v2_type": {"name": "grass"}
                      },
                      {
                        "pokemon_v2_type": {"name": "poison"}
                      }
                    ]
                  }
                ]
              },
            ),
          ),
        );

      final input = await gateway.buildInput(
        PokemonProfileDomainToGatewayModel(name: 'pikachu'),
      );

      expect(input.isRight, isTrue);

      final profile = input.right.profile;

      expect(profile.baseExperience, equals(142));
      expect(profile.height, equals(10));
      expect(profile.weight, equals(130));

      final stats = profile.stats;

      expect(stats.first.name, equals('hp'));
      expect(stats.first.baseStat, equals(60));

      expect(stats.last.name, equals('speed'));
      expect(stats.last.baseStat, equals(60));

      final type = profile.types.first;

      expect(type, equals('grass'));
    });

    test('failure', () async {
      final gateway = PokemonProfileGateway()
        ..feedResponse(
          (request) async => Either.left(
            UnknownFailureResponse('No Internet'),
          ),
        );

      final input = await gateway.buildInput(
        PokemonProfileDomainToGatewayModel(name: 'pikachu'),
      );

      expect(input.isLeft, isTrue);

      expect(input.left.message, equals('No Internet'));
    });
  });
}
