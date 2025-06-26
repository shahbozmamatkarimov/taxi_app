import 'package:flutter/material.dart';
import 'package:taxi_app/core/resources/app_colors.dart';

class RideOptionCard extends StatelessWidget {
  final String title;
  final String details;
  final double price;
  final bool isSelected;
  final VoidCallback onTap;

  const RideOptionCard({
    required this.title,
    required this.details,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? AppColors.primary : Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_car, size: 24),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(details, style: TextStyle(color: AppColors.grey)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$${price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                if (title == 'Economy') Text('Cheapest', style: TextStyle(color: AppColors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}