import 'package:flutter/material.dart';
import 'package:to_do_app/theme_ext.dart';

class NotificationBtn extends StatelessWidget {
  const NotificationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: context.surfaceColor),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.notifications_none,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
