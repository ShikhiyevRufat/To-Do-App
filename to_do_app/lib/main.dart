import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_app/app/todo.dart';
import 'package:to_do_app/local_notifications.dart';
import 'package:to_do_app/view/main/home/data/category_storage_service.dart';
import 'package:to_do_app/view/main/profile/data/model/avatar_storage_service.dart';
import 'package:userorient_flutter/userorient_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(CategoryStorageService());
  Get.put(AvatarStorageService());
  await LocalNotifications.init();
  tz.initializeTimeZones();

  UserOrient.configure(
    apiKey: 'b0841b71-e5b0-4b78-baa6-bd3b32815afb',
    languageCode: 'en',
  );

  runApp(
    const ProviderScope(
      child: ToDoApp(),
    ),
  );
}
