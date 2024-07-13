// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/view/main/home/category_page.dart';
import 'package:to_do_app/view/main/home/home_page.dart';
import 'package:to_do_app/view/main/home/see_all.dart';
import 'package:to_do_app/view/main/main_page.dart';
import 'package:to_do_app/view/main/profile/profile_page.dart';
import 'package:to_do_app/view/main/tasks/create_task.dart';
import 'package:to_do_app/view/main/tasks/tasks_page.dart';
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
    // GoRoute(
    //   path: Routes.login,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginPage();
    //   },
    // ),
    // GoRoute(
    //   path: Routes.register,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const RegisterPage();
    //   },
    // ),
    GoRoute(
      path: Routes.mainPage,
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: Routes.tasks,
      builder: (BuildContext context, GoRouterState state) {
        return const TasksPage();
      },
    ),
    GoRoute(
      path: Routes.profile,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: Routes.createTasks,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateTask();
      },
    ),
    GoRoute(
      path: Routes.categoryPage,
      builder: (BuildContext context, GoRouterState state) {
        final category = state.extra as String;
        return CategoryPage(category: category);
      },
    ),
    GoRoute(
      path: Routes.seeAll,
      builder: (BuildContext context, GoRouterState state) {
        return const SeeAll();
      },
    ),
  ],
);
