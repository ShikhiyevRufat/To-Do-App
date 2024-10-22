import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/view/main/home/presentation/Widgets/check_box_card.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          locale.see_all,
          style: TextStyles.heading24.copyWith(
            fontSize: 22,
          ),
        ),
      ),
      body: taskProvider.tasks.where((task) {
        DateTime taskDate = DateFormat('yyyy-MM-dd').parse(task.date);
        DateTime now = DateTime.now();
        return taskDate.year == now.year &&
            taskDate.month == now.month &&
            taskDate.day == now.day;
      }).isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty_rounded, size: 70, color: context.onSurfaceColor,),
                  SizedBox(height: 20.h),
                  Text(
                    locale.no_tasks_for_today,
                    style: TextStyles.display14.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: taskProvider.tasks.where(
                  (task) {
                    DateTime taskDate =
                        DateFormat('yyyy-MM-dd').parse(task.date);
                    DateTime now = DateTime.now();
                    return taskDate.year == now.year &&
                        taskDate.month == now.month &&
                        taskDate.day == now.day;
                  },
                ).map(
                  (task) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CheckBoxCard(
                        containerColor: context.primaryColor,
                        activeColor: context.primaryColor,
                        colorBorder: context.primaryColor,
                        title: task.name,
                        startTime: task.startTime,
                        endTime: task.endTime,
                        isChecked: task.isCompleted,
                        onChanged: (value) {
                          taskProvider.updateTaskStatus(task);
                        },
                      ),
                    );
                  },
                ).toList(),
              ).scaffoldPadding,
            ),
    );
  }
}
