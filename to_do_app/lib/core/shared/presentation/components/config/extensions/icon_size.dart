import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/shared/presentation/components/config/sizes.dart';

extension IconSizeExt on Sizes {
  double get iconSize {
    switch (this) {
      case Sizes.xs:
        return 18.sp;
      case Sizes.s:
        return 22.sp;
      case Sizes.m:
        return 24.sp;
      case Sizes.l:
        return 28.sp;
      case Sizes.xl:
        return 32.sp;
      default:
        return 0;
    }
  }
}
