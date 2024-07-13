import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';

extension PaddingExt on Sizes {
  EdgeInsets get verticalPadding {
    switch (this) {
      case Sizes.xs:
        return EdgeInsets.symmetric(vertical: 4.h);
      case Sizes.s:
        return EdgeInsets.symmetric(vertical: 8.h);
      case Sizes.m:
        return EdgeInsets.symmetric(vertical: 12.h);
      case Sizes.l:
        return EdgeInsets.symmetric(vertical: 16.h);
      case Sizes.xl:
        return EdgeInsets.symmetric(vertical: 20.h);
      default:
        return EdgeInsets.zero;
    }
  }

  EdgeInsets get horizontalPadding {
    switch (this) {
      case Sizes.xs:
        return EdgeInsets.symmetric(horizontal: 4.w);
      case Sizes.s:
        return EdgeInsets.symmetric(horizontal: 8.w);
      case Sizes.m:
        return EdgeInsets.symmetric(horizontal: 12.w);
      case Sizes.l:
        return EdgeInsets.symmetric(horizontal: 16.w);
      case Sizes.xl:
        return EdgeInsets.symmetric(horizontal: 24.w);
      default:
        return EdgeInsets.zero;
    }
  }
}

extension DefaultPadding on Widget {
  Widget get scaffoldPadding => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: this,
      );
}
