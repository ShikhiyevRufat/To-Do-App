import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/router/routes.dart';
import 'package:to_do_app/services/authentication.dart';
import 'package:to_do_app/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/shared/presentation/components/config/extensions/padding_ext.dart';
import 'package:to_do_app/shared/presentation/components/inputs/register_field.dart';
import 'package:to_do_app/view/auth/presentation/widget/show_message.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  bool isLoading = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void signUpUser() async {
    String res = await AuthMethods().signUpUser(
        email: emailController.text, password: passwordController.text);

    if (res == "Success") {
      setState(() {
        isLoading = true;
      });
      context.pushReplacement(Routes.home);
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  void depose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                  "assets/todo.png",
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
                label: "Sign up",
                color: const Color.fromARGB(255, 115, 80, 255),
                onPressed: () => signUpUser(),
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
              "Already an account?",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () => context.pushReplacement(Routes.login),
              child: const Text(
                "Login!",
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
