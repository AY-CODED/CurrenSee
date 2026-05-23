import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.currency_exchange,
            label: "CONVERT",
            index: 0,
            isSelected: currentIndex == 0,
          ),

          _buildNavItem(
            icon: Icons.grid_view,
            label: "MARKET",
            index: 1,
            isSelected: currentIndex == 1,
          ),

          _buildNavItem(
            icon: Icons.show_chart,
            label: "TRENDS",
            index: 2,
            isSelected: currentIndex == 2,
          ),

          _buildNavItem(
            icon: Icons.history,
            label: "HISTORY",
            index: 3,
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEDE7FF)
              : Colors.transparent,

          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected
                  ? const Color(0xFF6A4CE4)
                  : Colors.grey,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF6A4CE4)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}