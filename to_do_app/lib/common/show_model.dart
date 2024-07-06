import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constants/app_style.dart';
import 'package:to_do_app/model/to_do_model.dart';
import 'package:to_do_app/provider/date_time_provider.dart';
import 'package:to_do_app/provider/radio_provider.dart';
import 'package:to_do_app/provider/service_provider.dart';
import 'package:to_do_app/view/main/widget/date_time_widget.dart';
import 'package:to_do_app/view/main/widget/radio_widget.dart';
import 'package:to_do_app/view/main/widget/text_field_widget.dart';

class AddNewTaskModel extends StatefulWidget {
  const AddNewTaskModel({super.key});

  @override
  _AddNewTaskModelState createState() => _AddNewTaskModelState();
}

class _AddNewTaskModelState extends State<AddNewTaskModel> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dateProvider = ref.watch(dateTimeProvider);
        final user = ref.watch(authStateProvider).asData?.value;

        return Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "New Task To-Do",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Divider(
                thickness: 1.2,
                color: Colors.grey.shade200,
              ),
              const Gap(12),
              const Text(
                "Title Task",
                style: AppStyle.headingOne,
              ),
              const Gap(6),
              TextFieldWidget(
                txtController: titleController,
                maxLine: 1,
                hintText: 'Add Task Name',
              ),
              const Gap(12),
              const Text(
                'Description',
                style: AppStyle.headingOne,
              ),
              const Gap(6),
              TextFieldWidget(
                hintText: 'Add Description',
                maxLine: 5,
                txtController: descriptionController,
              ),
              const Gap(12),
              const Text(
                'Category',
                style: AppStyle.headingOne,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioWidget(
                      valueInput: 1,
                      categoryColor: Colors.green,
                      titleRadio: 'Learn',
                      onChangedValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 1),
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      valueInput: 2,
                      categoryColor: Colors.blue,
                      titleRadio: 'Work',
                      onChangedValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 2),
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      valueInput: 3,
                      categoryColor: Colors.orange,
                      titleRadio: 'Fun',
                      onChangedValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 3),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateTimeWidget(
                    timeName: 'Date',
                    timeForm: dateProvider,
                    timeIcon: CupertinoIcons.calendar,
                    onTap: () async {
                      final getValue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2050),
                      );
                      if (getValue != null) {
                        final format = DateFormat.yMd();
                        ref
                            .read(dateTimeProvider.notifier)
                            .update((state) => format.format(getValue));
                      }
                    },
                  ),
                  const Gap(22),
                  DateTimeWidget(
                    timeName: 'Time',
                    timeForm: ref.watch(timeProvider),
                    timeIcon: CupertinoIcons.clock,
                    onTap: () async {
                      final getTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (getTime != null) {
                        ref.read(timeProvider.notifier).update(
                              (state) => getTime.format(
                                context,
                              ),
                            );
                      }
                    },
                  ),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade800,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.blue.shade800),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14)),
                      onPressed: () {
                        if (user != null) {
                          final getRadioValue = ref.read(radioProvider);
                          String category = '';

                          switch (getRadioValue) {
                            case 1:
                              category = "Learning";
                              break;
                            case 2:
                              category = "Working";
                              break;
                            case 3:
                              category = "Funny";
                              break;
                          }
                          ref.read(serviceProvider).addNewTask(
                                ToDoModel(
                                  taskId: '',
                                  uid: user.uid,
                                  email: user.email,
                                  titleTask: titleController.text,
                                  description: descriptionController.text,
                                  category: category,
                                  dateTask: ref.read(dateTimeProvider),
                                  timeTask: ref.read(timeProvider),
                                  isDone: false,
                                ),
                              );
                          titleController.clear();
                          descriptionController.clear();
                          ref.read(radioProvider.notifier).update((state) => 0);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User not logged in'),
                            ),
                          );
                        }
                      },
                      child: const Text("Create"),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
