import 'package:flutter/material.dart';

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
            border: Border.all(color: const Color(0xFF806DFB)),
            color: isPast
                ? const Color.fromARGB(255, 250, 234, 253)
                : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 20),
        child: childWidget,
      ),
    );
  }
}
