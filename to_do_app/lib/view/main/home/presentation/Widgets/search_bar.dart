import 'package:flutter/material.dart';
import 'package:to_do_app/core/extensions/text_style.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF806DFB),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
    );
  }
}
