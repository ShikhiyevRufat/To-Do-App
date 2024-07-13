import 'package:flutter/material.dart';

class NotificationBtn extends StatelessWidget {
  const NotificationBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade200),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.notifications_none,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
