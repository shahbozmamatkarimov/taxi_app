import 'package:flutter/material.dart';

class RecentTripCard extends StatelessWidget {
  final String from;
  final String to;
  final String date;

  const RecentTripCard({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(child: Text('$from → $to', style: const TextStyle(fontWeight: FontWeight.bold))),
          const Icon(Icons.calendar_today, size: 16),
          const SizedBox(width: 4),
          Text(date),
        ],
      ),
    );
  }
}
