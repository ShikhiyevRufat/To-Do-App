import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/router/app_router.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';

class BottomSheetAction {
  final String label;
  final Function() onPressed;
  final bool isPrimary;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? boxHeight;

  BottomSheetAction({
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
    this.leadingIcon,
    this.trailingIcon,
    this.boxHeight,
  });
}

class AppBottomSheet {
  AppBottomSheet();

  static void show({
    required String label,
    BuildContext? context,
    List<BottomSheetAction>? actions,
    Widget? child,
    double? boxHeight,
  }) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.grey.shade100,
      barrierColor: Colors.black.withOpacity(.4),
      context: context ?? globalContext,
      scrollControlDisabledMaxHeightRatio: 0.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return BottomSheetScaffold(
          label: label,
          actions: actions,
          boxHeight: boxHeight,
          child: child,
        );
      },
    );
  }
}

class BottomSheetScaffold extends StatelessWidget {
  final String label;
  final List<BottomSheetAction>? actions;
  final double? boxHeight;
  final Widget? child;

  const BottomSheetScaffold({
    super.key,
    this.actions,
    required this.label,
    this.boxHeight,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          390.horizontalSpace,
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyles.heading20,
            ),
          ),
          8.verticalSpace,
          const Divider(height: 0),
          if (child != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: boxHeight ?? 440.h,
                  minHeight: 100.h,
                ),
                child: Scrollbar(child: child!),
              ),
            ),
          if (child != null && actions != null && actions!.isNotEmpty)
            const Divider(height: 0),
          if (actions != null && actions!.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 70.h,
                child: Row(
                  children: List.generate(
                    actions!.length,
                    (index) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              fontSize: Sizes.m,
                              leadingIcon: actions![index].leadingIcon,
                              trailingIcon: actions![index].trailingIcon,
                              onPressed: actions![index].onPressed,
                              label: actions![index].label,
                              color: actions![index].isPrimary
                                  ? const Color(0xFF806DFB)
                                  : Colors.grey.shade300,
                              secondaryColor: actions![index].isPrimary
                                  ? Colors.grey.shade100
                                  : Colors.black,
                            ),
                          ),
                          if (index != actions!.length - 1) 8.horizontalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
