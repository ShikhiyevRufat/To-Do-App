import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/text_field.dart';
import 'package:to_do_app/local_notifications.dart';
import 'package:to_do_app/locale/l10n.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/theme_ext.dart';
import 'package:to_do_app/view/main/profile/presentation/widget/reminder_switch.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';

class CreateTask extends ConsumerStatefulWidget {
  const CreateTask({super.key});

  @override
  ConsumerState<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _startTimeFocusNode = FocusNode();
  final FocusNode _endTimeFocusNode = FocusNode();

  String _selectedCategory = locale.high;

  Future<void> _selectTime(BuildContext context,
      TextEditingController controller, FocusNode focusNode) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });

      focusNode.requestFocus();
      focusNode.unfocus();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      _dateFocusNode.requestFocus();
      _dateFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _dateFocusNode.dispose();
    _startTimeFocusNode.dispose();
    _endTimeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isReminderOn = ref.watch(reminderSwitchProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          locale.add_task,
          style: TextStyles.heading24.copyWith(
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              AppTextField(
                controller: _nameController,
                label: locale.task_name,
                hint: locale.working,
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                controller: _descriptionController,
                label: locale.description,
                maxLine: 5,
                hint: locale.description,
              ),
              SizedBox(
                height: 12.h,
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  hintText: locale.select_category,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 20.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: [locale.high, locale.medium, locale.low]
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                hint: locale.date,
                enabled: true,
                trailing: Icons.calendar_today,
                controller: _dateController,
                focusNode: _dateFocusNode,
                onTap: () => _selectDate(context),
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                hint: locale.start_time,
                enabled: true,
                trailing: Icons.access_time,
                controller: _startTimeController,
                focusNode: _startTimeFocusNode,
                onTap: () => _selectTime(
                    context, _startTimeController, _startTimeFocusNode),
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                hint: locale.end_time,
                enabled: true,
                trailing: Icons.access_time,
                controller: _endTimeController,
                focusNode: _endTimeFocusNode,
                onTap: () =>
                    _selectTime(context, _endTimeController, _endTimeFocusNode),
              ),
              SizedBox(
                height: 40.h,
              ),
              AppButton(
                color: context.primaryColor,
                label: locale.save,
                onPressed: () async {
                  final task = Task.create(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    category: _selectedCategory,
                    date: _dateController.text,
                    startTime: _startTimeController.text,
                    endTime: _endTimeController.text,
                  );

                  context.read<TaskProvider>().addTask(task);
         
                  if (isReminderOn) {
                    DateTime scheduledStartTime = DateFormat('yyyy-MM-dd HH:mm')
                        .parse('${_dateController.text} ${_startTimeController.text}');
                    DateTime scheduledEndTime = DateFormat('yyyy-MM-dd HH:mm')
                        .parse('${_dateController.text} ${_endTimeController.text}');

                    if (scheduledStartTime.isAfter(DateTime.now())) {
                      await LocalNotifications.scheduleNotification(
                        locale.start_task,
                        "${locale.your_task} ${_nameController.text} ${locale.time_is_starting_now}",
                        scheduledStartTime,
                        1,
                      );
                    }

                    if (scheduledEndTime.isAfter(DateTime.now())) {
                      await LocalNotifications.scheduleNotification(
                        locale.end_task,
                        "${locale.your_task} ${_nameController.text} ${locale.time_has_ended}",
                        scheduledEndTime,
                        2,
                      );
                    }
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          ).scaffoldPadding,
        ),
      ),
    );
  }
}
