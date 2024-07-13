import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/config/screen_size.dart';
import 'package:to_do_app/core/router/app_router.dart';
import 'package:to_do_app/view/main/presentation/navigation_bar/nav_bar_cubit.dart';
import 'package:to_do_app/view/main/profile/data/provider/avatars.dart';
import 'package:to_do_app/view/main/profile/data/provider/profile_provider.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenSize.phone,
      builder: (context, child) => MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => NavigationCubit(),
          ),
          Provider(create: (_) => AvatarProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => TaskProvider()),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'PodPlus',
              debugShowCheckedModeBanner: false,
              routerConfig: goRouter,
            );
          },
        ),
      ),
    );
  }
}
