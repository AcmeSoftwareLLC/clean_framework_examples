import 'package:clean_framework/clean_framework.dart';

class PokemonProfileModel {
  PokemonProfileModel({
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
  });

  factory PokemonProfileModel.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);

    return PokemonProfileModel(
      baseExperience: deserializer.getInt('base_experience'),
      height: deserializer.getInt('height'),
      weight: deserializer.getInt('weight'),
      stats: deserializer.getList(
        'pokemon_v2_pokemonstats',
        converter: PokemonStatModel.fromJson,
      ),
      types: deserializer.getList('pokemon_v2_pokemontypes',
          converter: (t) => t['pokemon_v2_type']['name']),
    );
  }

  final int baseExperience;
  final int height;
  final int weight;
  final List<PokemonStatModel> stats;
  final List<String> types;
}

class PokemonStatModel {
  PokemonStatModel({
    required this.name,
    required this.baseStat,
  });

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    final deserializer = Deserializer(json);
    final stat = deserializer('pokemon_v2_stat');

    return PokemonStatModel(
      name: stat.getString('name'),
      baseStat: deserializer.getInt('base_stat'),
    );
  }

  final String name;
  final int baseStat;
}
