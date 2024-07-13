import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/view/main/presentation/state/nav_bar_state.dart';
import '../constants/nav_bar_items.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.reels:
        emit(NavigationState(NavbarItem.reels, 1));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 2));
        break;
    }
  }
}
