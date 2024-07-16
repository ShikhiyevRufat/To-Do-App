import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/extensions/border_radius_ext.dart';
import 'package:to_do_app/core/shared/presentation/components/config/extensions/font_size.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';
import 'package:to_do_app/theme_ext.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.leading,
    this.trailing,
    this.size = Sizes.s,
    this.border = Sizes.xl,
    this.verticalPadding = Sizes.l,
    this.horizontalPadding = Sizes.l,
    this.hint,
    this.label,
    this.isRequired = false,
    this.autoFocus = false,
    this.enabled = false,
    this.unfocusable = true,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.hintStyle,
    this.onTap,
    this.focusNode,
    this.controller,
    this.borderColor,
    this.maxLine,
    this.icon,
    this.switchBtn,
  });

  final SvgPicture? icon;
  final IconData? leading;
  final IconData? trailing;
  final Sizes verticalPadding;
  final Sizes horizontalPadding;
  final String? label;
  final Sizes border;
  final String? hint;
  final String? initialValue;
  final bool isRequired;
  final bool enabled;
  final Sizes size;
  final int? maxLine;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onTap;
  final bool unfocusable;
  final bool autoFocus;
  final FocusNode? focusNode;
  final Color? borderColor;
  final TextEditingController? controller;
  final Transform? switchBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Text(
            isRequired ? '*$label' : label!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        12.verticalSpace,
        TextFormField(
          readOnly: enabled,
          maxLines: maxLine ?? 1,
          autofocus: autoFocus,
          onTap: onTap,
          focusNode: focusNode,
          controller: controller,
          onTapOutside: (_) =>
              unfocusable ? FocusScope.of(context).unfocus() : null,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: size.fontSize,color: Colors.black),
          initialValue: controller == null ? initialValue : null,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIconColor: Colors.black,
            suffixIconColor: Colors.black,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
            hintText: hint ?? label,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusColor: const Color.fromARGB(255, 158, 143, 254),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: leading != null ? Icon(leading) : null,
            suffixIcon: trailing != null
                ? Icon(
                    trailing,
                    color: Colors.grey,
                  )
                : switchBtn,
            enabledBorder: OutlineInputBorder(
              borderRadius: border.borderRadius,
              borderSide:
                  BorderSide(color: context.primaryColor, width: 1.2.r),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
        ),
      ],
    );
  }
}
