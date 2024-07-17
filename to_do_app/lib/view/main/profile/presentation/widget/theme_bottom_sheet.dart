import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  final List<Image> colors;
  final String name;
  final String btnName;
  final Function onBtnFunc;

  const ThemeBottomSheet({
    super.key,
    required this.colors,
    required this.name,
    required this.btnName,
    required this.onBtnFunc,
  });

  @override
  Widget build(BuildContext context) {
    int? selectedThemeIndex;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Divider(),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 300.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: colors.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedThemeIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: selectedThemeIndex == index
                                  ? context.primaryColor
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: colors[index],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppButton(
                        label: "Cancel",
                        color: context.surfaceColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: AppButton(
                        label: btnName,
                        color: context.surfaceColor,
                        onPressed: () {
                          if (selectedThemeIndex != null) {
                            final themeProvider = context.read<ThemeProvider>();
                            final themeData = themeProvider.getThemeData(selectedThemeIndex!);
                            themeProvider.setTheme(themeData);
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
