import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/shared/presentation/components/config/extensions/border_radius.dart';
import 'package:to_do_app/core/shared/presentation/components/config/extensions/font_size.dart';
import 'package:to_do_app/core/shared/presentation/components/config/extensions/padding_ext.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    super.key,
    this.leading,
    this.trailing,
    this.size = Sizes.l,
    this.border = Sizes.xl,
    this.verticalPadding = Sizes.l,
    this.horizontalPadding = Sizes.xl,
    this.hint,
    required this.label,
    this.isRequired = false,
    this.autoFocus = false,
    this.unfocusable = true,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.onTap,
    this.focusNode,
    this.controller,
    this.visibleFunc,
    required this.obsureText,
  });

  final SvgPicture? leading;
  final Widget? trailing;
  final Sizes verticalPadding;
  final Sizes horizontalPadding;
  final String label;
  final Sizes border;
  final String? hint;
  final String? initialValue;
  final bool isRequired;
  final Sizes size;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onTap;
  final bool unfocusable;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final VoidCallback? visibleFunc;
  final bool obsureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      obscureText: obsureText,
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
      onTapOutside: (_) => unfocusable ? FocusScope.of(context).unfocus() : null,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: size.fontSize),
      initialValue: controller == null ? initialValue : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding.verticalPadding.top,
          horizontal: horizontalPadding.horizontalPadding.left,
        ).copyWith(right: horizontalPadding.horizontalPadding.right + 30.w),
        hintText: hint ?? label,
        hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusColor: const Color.fromARGB(255, 115, 80, 255),
        filled: true,
        fillColor: Colors.transparent,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 10.w, 0), 
          child: leading,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: trailing,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: border.borderRadius,
          borderSide: BorderSide(color: const Color.fromARGB(255, 115, 80, 255), width: 1.2.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: border.borderRadius,
          borderSide: BorderSide(color: const Color.fromARGB(255, 105, 105, 105), width: 1.2.r),
        ),
        border: OutlineInputBorder(
          borderRadius: border.borderRadius,
        ),
      ),
    );
  }
}
