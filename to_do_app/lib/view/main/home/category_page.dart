import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/view/main/home/presentation/Widgets/check_box_card.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.getTasksByCategory(category);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          category,
          style: TextStyles.heading24.copyWith(
            fontSize: 22,
          ),
        ),
      ),
      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty_rounded,color: context.onSurfaceColor, size: 70,),
                  SizedBox(height: 20.h),
                  Text(
                    locale.no_tasks_available,
                    style: TextStyles.heading24.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: CheckBoxCard(
                    containerColor: context.primaryColor,
                    activeColor: context.primaryColor,
                    colorBorder: context.primaryColor,
                    title: task.name,
                    startTime: task.startTime,
                    endTime: task.endTime,
                    isChecked: task.isPast,
                  ),
                );
              },
            ).scaffoldPadding,
    );
  }
}
