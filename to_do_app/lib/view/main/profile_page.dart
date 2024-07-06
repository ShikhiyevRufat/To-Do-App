import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/router/routes.dart';
import 'package:to_do_app/services/authentication.dart';
import 'package:to_do_app/shared/presentation/components/config/extensions/padding_ext.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Stack(
          children: [
            Column(
              children: [
                InkWell(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  onTap: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.back),
                      Text(
                        "Back",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber.shade200,
                        radius: 60,
                      ),
                      SizedBox(height: 20.h),
                      const Text(
                        "Rufat Shikhiyev",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ).scaffoldPadding,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 450.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 220, 220, 220),
                        offset: Offset(0, -1),
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(CupertinoIcons.envelope_fill),
                        title: Text("Your suggestions"),
                        trailing: Icon(CupertinoIcons.forward),
                      ),
                      SizedBox(height: 8.h),
                      ListTile(
                        leading: const Icon(CupertinoIcons.delete_left_fill),
                        title: const Text("Log out"),
                        onTap: () async {
                          await AuthMethods().signOut();
                          context.push(Routes.login);
                        },
                        trailing: const Icon(CupertinoIcons.forward),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
