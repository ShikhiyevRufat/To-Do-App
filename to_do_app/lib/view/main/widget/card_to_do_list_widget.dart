import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/provider/service_provider.dart';

class CardToDoListWidget extends ConsumerWidget {
  const CardToDoListWidget({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toDoData = ref.watch(fetchProvider);
    return toDoData.when(
      data: (toDoData) {
        Color categoryColor = Colors.white;
        final getCategory = toDoData[getIndex].category;
        switch (getCategory) {
          case "Learning":
            categoryColor = Colors.green;
            break;
          case "Working":
            categoryColor = Colors.blue;
            break;
          case "Funny":
            categoryColor = Colors.orange;
            break;
        }
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: IconButton(
                            icon: const Icon(CupertinoIcons.delete),
                            onPressed: () => ref
                                .read(serviceProvider)
                                .deleteTask(toDoData[getIndex].uid, toDoData[getIndex].taskId),
                          ),
                          title: Text(
                            toDoData[getIndex].titleTask,
                            maxLines: 1,
                            style: TextStyle(
                                decoration: toDoData[getIndex].isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          subtitle: Text(
                            toDoData[getIndex].description,
                            maxLines: 1,
                            style: TextStyle(
                                decoration: toDoData[getIndex].isDone
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              value: toDoData[getIndex].isDone,
                              activeColor: Colors.blue,
                              onChanged: (value) => ref
                                  .read(serviceProvider)
                                  .updateTask(toDoData[getIndex].uid, toDoData[getIndex].taskId, value),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                children: [
                                  const Text("Today"),
                                  const Gap(12),
                                  Text(toDoData[getIndex].timeTask),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            const Gap(20)
          ],
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
