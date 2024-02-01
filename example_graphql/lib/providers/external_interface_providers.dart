import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example_graphql/providers/gateway_providers.dart';
import 'package:clean_framework_graphql/clean_framework_graphql.dart';

final pokemonExternalInterfaceProvider = ExternalInterfaceProvider(
  () => GraphQLExternalInterface.withService(
    service: GraphQLService(endpoint: 'https://beta.pokeapi.co/graphql/v1beta'),
  ),
  gateways: [
    pokemonCollectionGateway,
    pokemonProfileGateway,
    pokemonSpeciesGateway,
  ],
);
