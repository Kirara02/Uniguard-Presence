import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/pages/all_presence/all_presence_page.dart';
import 'package:unipres/presentation/pages/forgot_password/forgot_password.dart';
import 'package:unipres/presentation/pages/login/login_page.dart';
import 'package:unipres/presentation/pages/main/main_page.dart';
import 'package:unipres/presentation/pages/splash/splash_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: Routes.SPLASH,
          name: "splash",
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: Routes.LOGIN,
          name: "login",
          builder: (context, state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: Routes.MAIN,
          name: "main",
          builder: (context, state) {
            return MainPage();
          },
        ),
        GoRoute(
          path: Routes.FORGOT_PASSWORD,
          name: "forgot_password",
          builder: (context, state) {
            return const ForgotPassword();
          },
        ),
        GoRoute(
          path: Routes.ALL_PRESENCE,
          name: "all-presence",
          builder: (context, state) {
            return const AllPresencePage();
          },
        ),
      ],
      initialLocation: Routes.SPLASH,
      debugLogDiagnostics: false,
    );
