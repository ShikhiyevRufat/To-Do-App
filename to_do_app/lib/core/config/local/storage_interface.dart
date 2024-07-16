abstract class StorageInterface {
  Future<void> initStorage();
  Future<void> write(String key, dynamic value);
  dynamic read(String key);
  Future<void> remove(String key);
}
