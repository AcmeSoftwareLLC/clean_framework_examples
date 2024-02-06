import 'package:clean_framework_firebase_example/features/navigation/presentation/navigation_ui.dart';
import 'package:clean_framework_router/clean_framework_router.dart';

class ExampleRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(
      debugLogDiagnostics: true,
      routes: [
        AppRoute(
          route: Routes.home,
          builder: (_, __) => NavigationUI(),
        ),
      ],
    );
  }
}

enum Routes with RoutesMixin {
  home('/'),
  profile('profile');

  const Routes(this.path);

  @override
  final String path;
}
