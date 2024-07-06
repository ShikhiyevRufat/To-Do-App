import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.titleRadio,
    required this.categoryColor,
    required this.valueInput,
    required this.onChangedValue,
  });

  final String titleRadio;
  final Color categoryColor;
  final int valueInput;
  final VoidCallback onChangedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioCategory = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
          activeColor: categoryColor,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
              offset: const Offset(-22, 0),
              child: Text(
                titleRadio,
                style: TextStyle(
                    color: categoryColor, fontWeight: FontWeight.w700),
              )),
          value: valueInput,
          groupValue: radioCategory,
          onChanged: (value) => onChangedValue(),
        ),
      ),
    );
  }
}
