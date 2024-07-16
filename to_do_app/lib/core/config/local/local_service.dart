import 'package:get_storage/get_storage.dart';
import 'local_keys.dart';
import 'storage_interface.dart';

class GetStorageImpl implements StorageInterface {
  final box = GetStorage(LocalKeys.boxName);

  @override
  Future<void> initStorage() async {
    await GetStorage.init(LocalKeys.boxName);
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await box.write(key, value);
  }

  @override
  dynamic read(String key) {
    return box.read(key);
  }

  @override
  Future<void> remove(String key) async {
    await box.remove(key);
  }
}
