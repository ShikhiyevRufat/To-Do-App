import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extensions/text_style.dart';

class CategoryCard extends StatelessWidget {
  final String categoryText;
  final VoidCallback onTap;
  final double progress;

  const CategoryCard({
    super.key,
    required this.categoryText,
    required this.onTap,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Card(
          shadowColor: Colors.grey.shade400,
          elevation: 4,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 200.w,
              height: 220.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-1, 1),
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                  ),
                ],
                color: const Color(0xFFf1ebfa),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              categoryText,
                              style: TextStyles.display12,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_outward_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "UI Interface App",
                      style: TextStyles.display16
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Flexible(
                      child: Text(
                        "Design user interface using prototype",
                        style: TextStyles.display12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Progress",
                          style: TextStyles.display12,
                        ),
                        Text(
                          '${(progress * 100).toStringAsFixed(0)}%',
                          style: TextStyles.display12,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 4.h,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: progress,
                        backgroundColor: Colors.grey[400],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF806DFB)),
                        minHeight: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}