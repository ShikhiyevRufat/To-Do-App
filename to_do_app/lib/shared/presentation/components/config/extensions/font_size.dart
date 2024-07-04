import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/shared/presentation/components/config/sizes.dart';

extension FontSize on Sizes {
  double get fontSize {
    switch (this) {
      case Sizes.xs:
        return 12.sp;
      case Sizes.s:
        return 14.sp;
      case Sizes.m:
        return 16.sp;
      case Sizes.l:
        return 18.sp;
      case Sizes.xl:
        return 20.sp;
      default:
        return 0;
    }
  }
}
