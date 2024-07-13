import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';

extension ButtonSize on Sizes {
  Size get buttonSize {
    switch (this) {
      case Sizes.xs:
        return Size(50.w, 10.h);
      case Sizes.s:
        return Size(100.w, 20.h);
      case Sizes.m:
        return Size(180.w, 30.h);
      case Sizes.l:
        return Size(240.w, 40.h);
      case Sizes.xl:
        return Size(320.w, 60.h);
      default:
        return const Size.fromHeight(0);
    }
  }
}
