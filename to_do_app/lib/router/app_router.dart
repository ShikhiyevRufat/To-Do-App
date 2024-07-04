// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/view/auth/login_page.dart';
import 'package:to_do_app/view/auth/register_page.dart';
import 'package:to_do_app/view/main/home_page.dart';
import 'package:to_do_app/view/main/profile_page.dart';
import 'package:to_do_app/view/splash/splash_page.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

BuildContext globalContext =
    goRouter.configuration.navigatorKey.currentState!.context;

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: Routes.register,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: Routes.profile,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
  ],
);
