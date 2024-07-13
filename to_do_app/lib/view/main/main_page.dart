import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/view/main/home/home_page.dart';
import 'package:to_do_app/view/main/presentation/constants/nav_bar_items.dart';
import 'package:to_do_app/view/main/presentation/navigation_bar/custom_nav_bar.dart';
import 'package:to_do_app/view/main/presentation/navigation_bar/nav_bar_cubit.dart';
import 'package:to_do_app/view/main/presentation/state/nav_bar_state.dart';
import 'package:to_do_app/view/main/profile/profile_page.dart';
import 'package:to_do_app/view/main/tasks/tasks_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomNavBar(),
          body: switch (state.navbarItem) {
            NavbarItem.home => const HomePage(),
            NavbarItem.reels => const TasksPage(),
            NavbarItem.profile => const ProfilePage(),
            _ => throw UnimplementedError('no such index'),
          },
        );
      },
    );
  }
}
