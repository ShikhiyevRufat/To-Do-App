import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider_pkg;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/app_theme.dart';
import 'package:to_do_app/core/config/screen_size.dart';
import 'package:to_do_app/core/router/app_router.dart';
import 'package:to_do_app/locale/cubit/locale.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_provider.dart';
import 'package:to_do_app/view/main/presentation/navigation_bar/nav_bar_cubit.dart';
import 'package:to_do_app/view/main/profile/data/provider/avatars.dart';
import 'package:to_do_app/view/main/profile/data/provider/color_app.dart';
import 'package:to_do_app/view/main/profile/data/provider/profile_provider.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';

class ToDoApp extends ConsumerWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: ScreenSize.phone,
      builder: (context, child) => provider_pkg.MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => NavigationCubit(),
          ),
          provider_pkg.Provider(create: (_) => AvatarProvider()),
          provider_pkg.Provider(create: (_) => ColorAppProvider()),
          provider_pkg.ChangeNotifierProvider(create: (_) => UserProvider()),
          provider_pkg.ChangeNotifierProvider(create: (_) => TaskProvider()),
          provider_pkg.ChangeNotifierProvider(create: (_) => ThemeProvider(ThemeData(colorScheme: AppTheme.blueColorScheme))), // Add the ThemeProvider
        ],
        child: Builder(
          builder: (context) {
            final locale = ref.watch(localeProvider);
            return provider_pkg.Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return MaterialApp.router(
                  title: 'PodPlus',
                  locale: locale,
                  localizationsDelegates: LocalizationConfigs.delegates,
                  supportedLocales: LocalizationConfigs.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  routerConfig: goRouter,
                  theme: themeProvider.themeData,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
