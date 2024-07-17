import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryStorageService extends GetxService {
  final GetStorage _box = GetStorage();

  double getProgress(String category) {
    return _box.read<double>('progress_$category') ?? 0.0;
  }

  void saveProgress(String category, double progress) {
    _box.write('progress_$category', progress);
  }
}
