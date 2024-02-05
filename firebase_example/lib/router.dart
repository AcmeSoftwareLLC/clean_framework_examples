import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:clean_framework_firebase_example/features/home/presentation/home_ui.dart';
import 'package:clean_framework_firebase_example/features/profile/presentation/profile_ui.dart';

class ExampleRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(
      debugLogDiagnostics: true,
      routes: [
        AppRoute(
          route: Routes.home,
          builder: (_, __) => HomeUI(),
          routes: [
            AppRoute(
              route: Routes.profile,
              builder: (_, __) => ProfileUI(),
            )
          ],
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
