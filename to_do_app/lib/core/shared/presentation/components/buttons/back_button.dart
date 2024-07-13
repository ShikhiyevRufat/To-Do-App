import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/shared/presentation/animations/bouncing_animation.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      duration: const Duration(milliseconds: 200),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.square(44.h),
          maximumSize: Size.square(44.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed ?? () => context.pop(),
        child: const Icon(
          Icons.keyboard_backspace,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
