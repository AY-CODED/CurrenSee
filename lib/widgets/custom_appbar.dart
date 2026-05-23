import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF5F5F5),
      elevation: 0,
      automaticallyImplyLeading: false,

      title: const Text(
        "CurrenSee",
        style: TextStyle(
          color: Color(0xFF4B2BE3),
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF6A4CE4),
            child: Text(
              "UP",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}