import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/core/pokemon/pokemon_failure_response.dart';

class PokemonCollectionFailureDomainInput extends FailureDomainInput {
  PokemonCollectionFailureDomainInput({required this.type, super.message});

  final PokemonFailureType type;
}

class PokemonCollectionSuccessDomainInput extends SuccessDomainInput {
  PokemonCollectionSuccessDomainInput({required this.pokemonIdentities});

  final List<PokemonIdentity> pokemonIdentities;
}

class PokemonIdentity {
  PokemonIdentity({required this.name, required this.id});

  final String name;
  final String id;

  factory PokemonIdentity.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);

    return PokemonIdentity(
      name: deserializer.getString('name'),
      id: deserializer.getInt('id').toString(),
    );
  }
}
