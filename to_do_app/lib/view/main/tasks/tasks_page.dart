import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/shared/presentation/components/date/horizontal_calendar.dart';
import 'package:to_do_app/view/main/presentation/widgets/notification_btn.dart';
import 'package:to_do_app/view/main/tasks/presentation/widget/doing_card.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;

  const CustomAppBar({super.key, required this.height, required this.child});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child,
    );
  }
}


class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  DateTime selectedDate = DateTime.now();

  void _onDateChange(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(
        height: 120.0,
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyles.display16.copyWith(color: Colors.grey),
                    ),
                    const NotificationBtn(),
                  ],
                ),
                const SizedBox(height: 8.0), 
                Text(
                  "Today",
                  style: TextStyles.display20.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          HorizontalWeekCalendar(
            minDate: DateTime(2024),
            maxDate: DateTime(2030),
            initialDate: DateTime.now(),
            activeTextColor: Colors.grey,
            inactiveTextColor: Colors.grey,
            activeBackgroundColor: const Color.fromARGB(255, 250, 234, 253),
            inactiveBackgroundColor: Colors.white,
            onDateChange: _onDateChange,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(child: SingleChildScrollView(child: DoingCard(selectedDate: selectedDate))),
        ],
      ),
    );
  }
}
