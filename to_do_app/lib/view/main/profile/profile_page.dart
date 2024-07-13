import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/text_field.dart';
import 'package:to_do_app/view/main/profile/data/provider/avatars.dart';
import 'package:to_do_app/view/main/profile/data/provider/profile_provider.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/avatar_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:userorient_flutter/userorient_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final avatarProvider = Provider.of<AvatarProvider>(context);
    final avatarImages = avatarProvider.getAvatars();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: const BoxDecoration(
              color: Color(0xFFf1ebfa),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Text(
                    "Profile",
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
                      avatars: avatarImages,
                      name: "Choose avatar",
                      btnName: "Save",
                      onBtnFunc: () {},
                    ).show(context),
                    child: Text(
                      "Edit image and name",
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
                    hint: 'User feedback',
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
                    hint: 'Reminders',
                    enabled: true,
                    switchBtn: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        hoverColor: Colors.white,
                        thumbColor: const WidgetStatePropertyAll(Colors.white),
                        inactiveTrackColor: Colors.grey.shade300,
                        trackColor:
                            WidgetStatePropertyAll(Colors.grey.shade300),
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: 'Notifications',
                    enabled: true,
                    switchBtn: Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        hoverColor: Colors.white,
                        thumbColor: const WidgetStatePropertyAll(Colors.white),
                        inactiveTrackColor: Colors.grey.shade300,
                        trackColor:
                            WidgetStatePropertyAll(Colors.grey.shade300),
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                    onTap: () {
                      // Handle onTap
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AppTextField(
                    hint: 'Logout',
                    enabled: true,
                    trailing: Icons.keyboard_arrow_right_rounded,
                    onTap: () {
                      // Handle onTap
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ).scaffoldPadding,
            ),
          ),
        ],
      ),
    );
  }
}
