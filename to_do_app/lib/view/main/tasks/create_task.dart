import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/padding_ext.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/app_button.dart';
import 'package:to_do_app/core/shared/presentation/components/inputs/text_field.dart';
import 'package:to_do_app/view/main/tasks/data/model/task_model.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
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

  String _selectedCategory = 'High';

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    DarwinInitializationSettings initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
    );
  }

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

  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final now = DateTime.now();
    final String locationName = await FlutterNativeTimezone.getLocalTimezone();
    final location = tz.getLocation(locationName);
    final scheduledDate = tz.TZDateTime(
      location,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails platformChannelSpecifics = const NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add Task",
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
                label: 'Task name',
                hint: 'Working',
              ),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(
                controller: _descriptionController,
                label: 'Description',
                maxLine: 5,
                hint: 'I work today...',
              ),
              SizedBox(
                height: 12.h,
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Select Category',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 20.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF806DFB)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF806DFB)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: ['High', 'Medium', 'Low']
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
                hint: 'Date',
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
                hint: 'Start time',
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
                hint: 'End time',
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
                color: const Color(0xFF806DFB),
                label: 'Save',
                onPressed: () async {
                  final task = Task(
                    name: _nameController.text,
                    description: _descriptionController.text,
                    category: _selectedCategory,
                    date: _dateController.text,
                    startTime: _startTimeController.text,
                    endTime: _endTimeController.text,
                  );

                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(task);

                  // Schedule notification for start time and end time
                  if (_startTimeController.text.isNotEmpty) {
                    final DateTime now = DateTime.now();
                    final startTime = DateFormat.Hm().parse(_startTimeController.text);
                    final DateTime scheduledStartTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      startTime.hour,
                      startTime.minute,
                    );

                    await _scheduleNotification(
                      id: 1,
                      title: 'Task Started',
                      body: 'Your "${task.name}" task has started at ${_startTimeController.text}.',
                      time: TimeOfDay.fromDateTime(scheduledStartTime),
                    );
                  }

                  if (_endTimeController.text.isNotEmpty) {
                    final DateTime now = DateTime.now();
                    final endTime = DateFormat.Hm().parse(_endTimeController.text);
                    final DateTime scheduledEndTime = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      endTime.hour,
                      endTime.minute,
                    );

                    await _scheduleNotification(
                      id: 2,
                      title: 'Task Ended',
                      body: 'Your "${task.name}" task has ended at ${_endTimeController.text}.',
                      time: TimeOfDay.fromDateTime(scheduledEndTime),
                    );
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
