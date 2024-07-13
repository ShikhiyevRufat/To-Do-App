import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:to_do_app/view/main/tasks/presentation/widget/event_path.dart';

class TimeLineeUi extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventChild;

  const TimeLineeUi({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast
              ? const Color(0xFF806DFB)
              : const Color.fromARGB(255, 250, 234, 253),
        ),
        indicatorStyle: IndicatorStyle(
          width: 40.h,
          color: isPast
              ? const Color(0xFF806DFB)
              : const Color.fromARGB(255, 250, 234, 253),
          iconStyle: IconStyle(
            iconData: Icons.check_circle_outline,
            color: isPast
                ? Colors.white
                : const Color.fromARGB(255, 250, 234, 253),
          ),
        ),
        endChild: EventPath(
          isPast: isPast,
          childWidget: eventChild,
        ),
      ),
    );
  }
}
