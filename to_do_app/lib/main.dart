import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/router/app_router.dart';


void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: ProviderScope(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "To-Do App",
          theme: ThemeData(),
          routerConfig: goRouter,
          
        ),
      ),
    ),
  );
}

