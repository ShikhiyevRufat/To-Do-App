import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/router/routes.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/core/shared/presentation/components/config/extensions/padding_ext.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/register_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  bool isLoading = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              Hero(
                tag: "todoLogo",
                child: Image.asset(
                  "assets/images/todo.png",
                  height: 150.h,
                ),
              ),
              SizedBox(height: 70.h),
              SizedBox(
                width: double.infinity,
                child: RegisterField(
                  controller: emailController,
                  obsureText: false,
                  leading: SvgPicture.asset(
                    "assets/svg/email.svg",
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: RegisterField(
                  controller: passwordController,
                  leading: SvgPicture.asset(
                    "assets/svg/password.svg",
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Password",
                  trailing: GestureDetector(
                    onTap: _togglePasswordView,
                    child: SvgPicture.asset(
                      _isHidden
                          ? "assets/svg/invisible.svg"
                          : "assets/svg/visible.svg",
                      fit: BoxFit.scaleDown,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obsureText: _isHidden,
                ),
              ),
              SizedBox(height: 30.h),
              AppButton(
                fontWeight: FontWeight.bold,
                label: "Login",
                color: const Color.fromARGB(255, 115, 80, 255),
                onPressed: () => loginUser(),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => null,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 115, 80, 255),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ).scaffoldPadding,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don’t have an account?",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () => context.push(Routes.register),
              child: const Text(
                "Sign up!",
                style: TextStyle(
                  color: Color.fromARGB(255, 115, 80, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
