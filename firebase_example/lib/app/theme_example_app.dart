import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/providers/external_interface_providers.dart';
import 'package:clean_framework_firebase_example/router.dart';

class ThemeExampleApp extends StatelessWidget {
  const ThemeExampleApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppProviderScope(
      externalInterfaceProviders: [
        firebaseExternalInterfaceProvider,
      ],
      child: AppRouterScope(
        create: ExampleRouter.new,
        builder: (context) {
          return MaterialApp.router(
            title: 'Clean Framework Theme Example',
            routerConfig: context.router.config,
            theme: ThemeData(
              colorSchemeSeed: Colors.lightBlueAccent,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorSchemeSeed: Colors.green,
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
