import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extensions/text_style.dart';

class CheckBoxCard extends StatefulWidget {
  final String? title;
  final String? startTime;
  final String? endTime;
  final bool? isChecked;
  final ValueChanged<bool?>? onChanged;

  CheckBoxCard({
    super.key,
    this.title,
    this.startTime,
    this.endTime,
    this.isChecked,
    this.onChanged,
  });

  @override
  State<CheckBoxCard> createState() => _CheckBoxCardState();
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF806DFB),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title ?? 'No Title',
                  style: TextStyles.display18,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 14,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "${widget.startTime ?? 'Start Time'} - ${widget.endTime ?? 'End Time'}",
                        style:
                            TextStyles.display12.copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.white,
                side: const BorderSide(
                  color: Color(0xFF806DFB),
                ),
                activeColor: const Color(0xFF806DFB),
                value: widget.isChecked,
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
