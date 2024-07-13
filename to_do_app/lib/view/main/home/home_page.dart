import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/extensions/text_style.dart';
import 'package:to_do_app/core/router/routes.dart';
import 'package:to_do_app/core/shared/presentation/components/buttons/task_button.dart';
import 'package:to_do_app/view/main/home/presentation/Widgets/category_card.dart';
import 'package:to_do_app/view/main/home/presentation/Widgets/check_box_card.dart';
import 'package:to_do_app/view/main/presentation/widgets/notification_btn.dart';
import 'package:to_do_app/view/main/tasks/data/model/task_model.dart';
import 'package:to_do_app/view/main/tasks/data/provider/task_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final List<Widget> cards = [
      CategoryCard(
        categoryText: "Low",
        onTap: () {
          GoRouter.of(context).push(
            Routes.categoryPage,
            extra: "Low",
          );
        },
        progress: taskProvider.getCompletedTasksPercentage("Low"),
      ),
      CategoryCard(
        categoryText: "Medium",
        onTap: () {
          GoRouter.of(context).push(
            Routes.categoryPage,
            extra: "Medium",
          );
        },
        progress: taskProvider.getCompletedTasksPercentage("Medium"),
      ),
      CategoryCard(
        categoryText: "High",
        onTap: () {
          GoRouter.of(context).push(
            Routes.categoryPage,
            extra: "High",
          );
        },
        progress: taskProvider.getCompletedTasksPercentage("High"),
      ),
    ];

    String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());
    List<Task> displayedTasks = _searchQuery.isEmpty
        ? taskProvider.tasks.where((task) {
            DateTime taskDate = DateFormat('yyyy-MM-dd').parse(task.date);
            DateTime now = DateTime.now();
            return taskDate.year == now.year &&
                taskDate.month == now.month &&
                taskDate.day == now.day;
          }).toList()
        : taskProvider.searchTasks(_searchQuery);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
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
                          "Welcome back",
                          style: TextStyles.display16.copyWith(color: Colors.grey),
                        ),
                        const NotificationBtn(),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Rufat Shikhiyev👋",
                      style: TextStyles.display20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF806DFB),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyles.display14,
                          hintText: 'Search',
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        Text(
                          "Manage Daily tasks",
                          style: TextStyles.display20.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CarouselSlider(
                      items: cards,
                      options: CarouselOptions(
                        height: 220.h,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cards.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => setState(() => _currentIndex = entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  (Theme.of(context).brightness == Brightness.dark
                                          ? Colors.white
                                          : const Color(0xFF806DFB))
                                      .withOpacity(
                                          _currentIndex == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      formattedDate,
                      style: TextStyles.display12.copyWith(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Tasks",
                          style: TextStyles.display18.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => context.push(Routes.seeAll),
                              child: Text(
                                "See all",
                                style: TextStyles.display12.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    displayedTasks.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/empty.png",
                                  height: 100.h,
                                  width: 100.w,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "No tasks for today!",
                                  style: TextStyles.display14.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: displayedTasks.length,
                            itemBuilder: (context, index) {
                              final task = displayedTasks[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: CheckBoxCard(
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
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const TaskButton()
      ]),
    );
  }
}