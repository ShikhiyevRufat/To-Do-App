import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/text_field.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/view/main/profile/data/provider/profile_provider.dart';

class AvatarBottomSheet {
  final String name;
  final String btnName;
  final VoidCallback onBtnFunc;
  final List<Image> avatarPaths;

  AvatarBottomSheet({
    required this.avatarPaths,
    required this.name,
    required this.btnName,
    required this.onBtnFunc,
  });

  Future<void> show(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final nameController = TextEditingController(text: userProvider.name);

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: 20.h),
                  AppTextField(
                    label: locale.full_name,
                    controller: nameController,
                    hint: 'User name',
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 250.h,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: avatarPaths.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            userProvider.updateAvatar(avatarPaths[index]);
                          },
                          child: avatarPaths[index],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: context.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(color: context.primaryColor),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            locale.cancel,
                            style: const TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(btnName),
                          onPressed: () {
                            userProvider.updateProfile(
                              avatar: userProvider.avatar,
                              name: nameController.text,
                            );
                            onBtnFunc();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
