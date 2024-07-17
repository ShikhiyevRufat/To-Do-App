import 'package:get_storage/get_storage.dart';

class AvatarStorageService {
  final _box = GetStorage();

  List<String> get savedAvatars {
    return (_box.read<List<dynamic>>('avatars')?.cast<String>()) ?? [];
  }

  void saveAvatar(String avatarPath) {
    List<String> avatars = savedAvatars;
    avatars.add(avatarPath);
    _box.write('avatars', avatars);
  }

  void removeAvatar(String avatarPath) {
    List<String> avatars = savedAvatars;
    avatars.remove(avatarPath);
    _box.write('avatars', avatars);
  }
}
