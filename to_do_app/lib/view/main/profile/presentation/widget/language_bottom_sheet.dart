import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/shared/presentation/base/bottom_sheet.dart';
import 'package:to_do_app/locale/cubit/locale.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_ext.dart';



class LanguageBottomSheet {
  final LocaleNotifier localeNotifierRef;

  LanguageBottomSheet({required this.localeNotifierRef});

  Future<void> show(BuildContext context) async {
    return AppBottomSheet.show(
      label: locale.change_language,
      context: context,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            LanguageTile(
              isSelected: localeNotifierRef.currentLocale.languageCode == 'az',
              languageName: 'Azərbaycan',
              languageLocale: const Locale('az', 'AZ'),
              imageAdress: "assets/svg/azerbaijan.svg",
              onSelected: localeNotifierRef.changeLocale,
            ),
            LanguageTile(
              isSelected: localeNotifierRef.currentLocale.languageCode == 'en',
              languageName: 'English',
              languageLocale: const Locale('en', 'EN'),
              imageAdress: "assets/svg/united_kingdom.svg",
              onSelected: localeNotifierRef.changeLocale,
            ),
            LanguageTile(
              isSelected: localeNotifierRef.currentLocale.languageCode == 'ru',
              languageName: 'Russian',
              languageLocale: const Locale('ru', 'RU'),
              imageAdress: "assets/svg/russia.svg",
              onSelected: localeNotifierRef.changeLocale,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.isSelected,
    required this.languageName,
    required this.languageLocale,
    required this.imageAdress,
    required this.onSelected,
  });

  final bool isSelected;
  final String languageName;
  final Locale languageLocale;
  final String imageAdress;
  final ValueChanged<Locale> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(
                color: context.primaryColor,
                width: 0.3,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            )
          : null,
      child: ListTile(
        selected: isSelected,
        title: Text(languageName),
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(imageAdress),
        ),
        onTap: () async {
          onSelected(languageLocale);
          Navigator.pop(context);
        },
      ),
    );
  }
}
