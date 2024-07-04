import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/constants/app_style.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.timeName,
    required this.timeForm,
    required this.timeIcon,
    required this.onTap,
  });

  final String timeName;
  final IconData timeIcon;
  final String timeForm;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timeName,
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          InkWell(
            onTap: () => onTap(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(timeIcon),
                  const Gap(12),
                  Text(timeForm),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
