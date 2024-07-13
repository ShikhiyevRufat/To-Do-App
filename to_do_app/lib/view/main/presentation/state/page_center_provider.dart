import 'package:flutter/material.dart';
import 'package:to_do_app/view/main/presentation/constants/nav_bar_items.dart';

class MainPageNavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  NavbarItem _selectedItem = NavbarItem.home;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    _selectedItem = NavbarItem.values[index];
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  NavbarItem get selectedItem => _selectedItem;

}
