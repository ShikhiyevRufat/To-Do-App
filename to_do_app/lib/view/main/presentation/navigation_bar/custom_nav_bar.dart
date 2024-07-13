import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/view/main/presentation/constants/nav_bar_items.dart';
import 'package:to_do_app/view/main/presentation/navigation_bar/nav_bar_cubit.dart';
import 'package:to_do_app/view/main/presentation/state/nav_bar_state.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  final List<Map<String, String>> _navItems = [
    {"iconPath": "assets/svg/home.svg"},
    {"iconPath": "assets/svg/tasks.svg"},
    {"iconPath": "assets/svg/username.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              return GestureDetector(
                onTap: () => context
                    .read<NavigationCubit>()
                    .getNavBarItem(NavbarItem.values[index]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      item["iconPath"]!,
                      colorFilter: ColorFilter.mode(
                        state.index == index
                            ? const Color(0xFF806DFB)
                            : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: 80,
                      color: state.index == index
                          ? const Color(0xFF806DFB)
                          : Colors.transparent,
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
