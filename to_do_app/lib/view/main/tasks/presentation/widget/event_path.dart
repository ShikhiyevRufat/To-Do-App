import 'package:flutter/material.dart';
import 'package:to_do_app/theme_ext.dart';

class EventPath extends StatelessWidget {
  final bool isPast;
  final childWidget;

  const EventPath({super.key, required this.isPast, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: context.primaryColor),
            color: isPast ? context.onSurfaceColor : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 20),
        child: childWidget,
      ),
    );
  }
}
