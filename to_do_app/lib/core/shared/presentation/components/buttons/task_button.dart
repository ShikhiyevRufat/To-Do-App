import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/router/routes.dart';

class TaskButton extends StatelessWidget {
  const TaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 14.w,
      bottom: 10.h,
      child: InkWell(
        onTap: () {
          context.push(Routes.createTasks);
        },
        child: Container(
          height: 52.w,
          width: 52.w,
          decoration: BoxDecoration(
            color: const Color(0xFF806DFB),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 119, 118, 118).withOpacity(0.12),
                blurRadius: 2.r,
              ),
              BoxShadow(
                color:
                    const Color.fromARGB(255, 120, 120, 120).withOpacity(0.09),
                blurRadius: 5.r,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          child: const Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
