import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Image? _avatar;
  Image? colorApp;
  String _name = "User Name";

  Image? get avatar => _avatar;
  String get name => _name;

  void updateAvatar(Image avatar) {
    _avatar = avatar;
    notifyListeners();
  }

  void updateColor(Image color) {
    colorApp = color;
    notifyListeners();
  }

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateProfile({Image? avatar, String? name}) {
    if (avatar != null) _avatar = avatar;
    if (name != null) _name = name;
    notifyListeners();
  }
}
