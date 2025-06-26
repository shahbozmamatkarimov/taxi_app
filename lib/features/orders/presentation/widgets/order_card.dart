import 'package:flutter/material.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import 'package:taxi_app/core/widgets/w_button.dart';
import 'package:taxi_app/features/orders/presentation/widgets/driver_applications_sheet.dart';

class DriverInfo {
  final String name;
  final double rating;
  final String car;

  const DriverInfo({
    required this.name,
    required this.rating,
    required this.car,
  });
}

class OrderCard extends StatelessWidget {
  final String status;
  final String orderId;
  final String dateTime;
  final String from;
  final String to;
  final String passengers;
  final String luggage;
  final String price;
  final String? footerText;
  final DriverInfo? driverInfo;
  final bool isAccepted;

  const OrderCard({
    super.key,
    required this.status,
    required this.orderId,
    required this.dateTime,
    required this.from,
    required this.to,
    required this.passengers,
    required this.luggage,
    required this.price,
    this.footerText,
    this.driverInfo,
    required this.isAccepted,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'Pending' ? Colors.orange : Colors.green;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1), // light background
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Text(orderId, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 10),
              Text(dateTime, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          _locationRow(Icons.location_on, from, Colors.blue),
          const SizedBox(height: 5),
          _locationRow(Icons.location_on, to, Colors.green),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.people, size: 16),
              const SizedBox(width: 4),
              Text(passengers),
              const SizedBox(width: 16),
              const Icon(Icons.luggage, size: 16),
              const SizedBox(width: 4),
              Text(luggage),
              const Spacer(),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Text(footerText ?? '', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          if (!isAccepted)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: WButton(
                    text: "View Applications",
                    color: AppColors.blue,
                    textColor: AppColors.white,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // Makes it full screen
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) => const DriverApplicationsSheet(),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8),
                WButton(
                  text: "Cancel",
                  color: AppColors.grey,
                  buttonType: ButtonType.outline,
                  onTap: () => {},
                ),
              ],
            )
          else
            Column(
              children: [
                // const SizedBox(height: 10),
                _driverInfoSection(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: WButton(
                        text: "Track Trip",
                        color: AppColors.F3F4F6,
                        onTap: () => {},
                      ),
                    ),
                    SizedBox(width: 8),
                    WButton(
                      text: "Cancel",
                      color: AppColors.red,
                      textColor: AppColors.red,
                      buttonType: ButtonType.outline,
                      onTap: () => {},
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _locationRow(IconData icon, String address, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(address, style: const TextStyle(fontSize: 14))),
      ],
    );
  }

  Widget _driverInfoSection() {
    if (driverInfo == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  driverInfo!.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('${driverInfo!.rating}'),
                  ],
                ),
                Text(
                  driverInfo!.car,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
