import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart' as provider_pkg;
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/text_field.dart';
import 'package:to_do_app/locale/cubit/locale.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/view/main/profile/data/provider/avatars.dart';
import 'package:to_do_app/view/main/profile/data/provider/color_app.dart';
import 'package:to_do_app/view/main/profile/data/provider/profile_provider.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/language_bottom_sheet.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/reminder_switch.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/theme_bottom_sheet.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/avatar_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userorient_flutter/userorient_flutter.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = provider_pkg.Provider.of<UserProvider>(context);
    final avatarProvider = provider_pkg.Provider.of<AvatarProvider>(context);
    final colorProvider = provider_pkg.Provider.of<ColorAppProvider>(context);
    final avatarImages = avatarProvider.getAvatars();
    final colorImages = colorProvider.getColors();
    bool isReminderOn = ref.watch(reminderSwitchProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: context.onSurfaceColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Text(
                    locale.profile,
                    style: TextStyles.heading24.copyWith(fontSize: 22),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: userProvider.avatar?.image ??
                        const AssetImage("assets/images/1.png"),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    userProvider.name,
                    style: TextStyles.display20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 192, 192, 192),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => AvatarBottomSheet(
                      avatarPaths: avatarImages,
                      name: locale.choose_avatar,
                      btnName: locale.save,
                      onBtnFunc: () {},
                    ).show(context),
                    child: Text(
                      locale.edit_image_and_name,
                      style: TextStyles.display12.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () => launchUrl(
                        Uri.parse("https://buymeacoffee.com/rufatshikhiyev")),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          "assets/images/buy_me_coffe.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: locale.user_feedback,
                    enabled: true,
                    trailing: Icons.favorite_border_sharp,
                    onTap: () async {
                      UserOrient.setUser(language: "en");
                      await UserOrient.openBoard(context);
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: locale.reminders,
                    enabled: true,
                    switchBtn: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        hoverColor: Colors.white,
                        thumbColor: const WidgetStatePropertyAll(Colors.white),
                        inactiveTrackColor: Colors.grey.shade300,
                        activeTrackColor: context.primaryColor,
                        value: isReminderOn,
                        onChanged: (value) {
                          ref
                              .read(reminderSwitchProvider.notifier)
                              .toggleSwitch(value);
                        },
                      ),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: locale.change_theme,
                    enabled: true,
                    trailing: Icons.color_lens_outlined,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ThemeBottomSheet(
                            colors: colorImages,
                            name: locale.change_theme,
                            btnName: locale.save,
                            onBtnFunc: () {},
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: locale.change_language,
                    enabled: true,
                    trailing: Icons.language,
                    onTap: () {
                      LanguageBottomSheet(
                        localeNotifierRef: ref.read(localeProvider.notifier),
                      ).show(context);
                    },
                  ),
                ],
              ).scaffoldPadding,
            ),
          )
        ],
      ),
    );
  }
}
