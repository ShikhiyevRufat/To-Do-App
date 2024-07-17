import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_app/view/main/profile/data/model/avatar_storage_service.dart';

class UserProvider with ChangeNotifier {
  final GetStorage _storage = GetStorage();
  final AvatarStorageService _avatarStorageService = AvatarStorageService();
  Image? _avatar;
  String _name = "User Name";

  Image? get avatar => _avatar;
  String get name => _name;

  UserProvider() {
    _loadProfileData();
  }

  void _loadProfileData() {
    _name = _storage.read<String>('name') ?? "User Name";
    String? avatarPath = _avatarStorageService.savedAvatars.isNotEmpty
        ? _avatarStorageService.savedAvatars.first
        : null;
    if (avatarPath != null) {
      _avatar = Image.asset(avatarPath);
    }
    notifyListeners();
  }

  void updateAvatar(Image avatar) {
    _avatar = avatar;
    // Remove the old avatar
    _avatarStorageService.removeAvatar((avatar.image as AssetImage).assetName);
    // Save the new avatar
    _avatarStorageService.saveAvatar((avatar.image as AssetImage).assetName);
    notifyListeners();
  }

  void updateName(String name) {
    _name = name;
    _storage.write('name', name);
    notifyListeners();
  }

  void updateProfile({Image? avatar, String? name}) {
    if (avatar != null) {
      updateAvatar(avatar);
    }
    if (name != null) {
      updateName(name);
    }
  }
}