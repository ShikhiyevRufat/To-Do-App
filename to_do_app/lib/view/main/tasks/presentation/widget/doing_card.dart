import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';
import 'package:to_do_app/view/main/tasks/presentation/widget/time_linee_ui.dart';

class DoingCard extends StatelessWidget {
  final DateTime selectedDate;

  const DoingCard({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasksForSelectedDate = taskProvider.tasks.where((task) {
      DateTime taskDate = DateFormat('yyyy-MM-dd').parse(task.date);
      return taskDate.year == selectedDate.year &&
          taskDate.month == selectedDate.month &&
          taskDate.day == selectedDate.day;
    }).toList();

    if (tasksForSelectedDate.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/empty.png"),
            Text(
              "No tasks for today",
              style: TextStyles.display20.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: List.generate(tasksForSelectedDate.length, (index) {
          final task = tasksForSelectedDate[index];
          return GestureDetector(
            onTap: () {
              taskProvider.updateTaskStatus(task);
            },
            child: TimeLineeUi(
              isFirst: index == 0,
              isLast: index == tasksForSelectedDate.length - 1,
              isPast: task.isPast,
              eventChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        task.name,
                        style: TextStyles.display20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          taskProvider.removeTask(task);
                        },
                        child: const Icon(Icons.delete_rounded),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          "${task.startTime} - ${task.endTime}",
                          style:
                              TextStyles.display12.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        task.description,
                        style:
                            TextStyles.display12.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ).scaffoldPadding,
    );
  }
}
