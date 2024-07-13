import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';


extension BorderRadiusExt on Sizes {
  BorderRadius get borderRadius {
    switch (this) {
      case Sizes.zero:
        return BorderRadius.circular(0);
      case Sizes.xs:
        return BorderRadius.circular(4.r);
      case Sizes.s:
        return BorderRadius.circular(6.r);
      case Sizes.m:
        return BorderRadius.circular(8.r);
      case Sizes.l:
        return BorderRadius.circular(10.r);
      case Sizes.xl:
        return BorderRadius.circular(12.r);
      case Sizes.infinite:
        return BorderRadius.circular(999.r);
      default:
        return BorderRadius.circular(0);
    }
  }
}

class AppRadiuses {
  AppRadiuses._();

  static BorderRadius get borderRadius8 => BorderRadius.circular(8.r);
}
