import 'package:flutter/material.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import 'package:taxi_app/core/widgets/w_button.dart';

class DriverApplicationsSheet extends StatelessWidget {
  const DriverApplicationsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.3,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80), // Space for sticky button
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const Text(
                        'Driver Applications',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _applicationCard(
                        name: 'Akmal Karimov',
                        car: 'Chevrolet Cobalt • White • 01A123BC',
                        experience: '3 years',
                        trips: '1,240',
                        distance: '2.5 km',
                        time: '5 min',
                        rating: '4.8',
                      ),
                      const SizedBox(height: 12),
                      _applicationCard(
                        name: 'Bobur Saidov',
                        car: 'Toyota Camry • Black • 01B456EF',
                        experience: '2 years',
                        trips: '890',
                        distance: '4.1 km',
                        time: '8 min',
                        rating: '4.6',
                      ),
                      const SizedBox(height: 12),
                      _applicationCard(
                        name: 'Sardor Umarov',
                        car: 'Hyundai Elantra • Silver • 01C789GH',
                        experience: '4 years',
                        trips: '1,560',
                        distance: '6.3 km',
                        time: '12 min',
                        rating: '4.9',
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: SizedBox(
                width: double.infinity,
                child: WButton(
                  text: "Auto-assign Best Driver",
                  onTap: () => {},
                  color: AppColors.green,
                  textColor: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _applicationCard({
    required String name,
    required String car,
    required String experience,
    required String trips,
    required String distance,
    required String time,
    required String rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 16),
              Text(rating),
            ],
          ),
          const SizedBox(height: 4),
          Text(car, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16),
              Text(' $distance away  •  $time arrival'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Experience: $experience'), Text('Trips: $trips')],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: WButton(
                  text: "Accept",
                  color: AppColors.blue,
                  textColor: AppColors.white,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              WButton(
                text: '',
                color: AppColors.D1D5DB,
                buttonType: ButtonType.outline,
                onTap: () {},
                child: const Icon(Icons.call),
              ),
              const SizedBox(width: 8),
              WButton(
                text: '',
                color: AppColors.D1D5DB,
                buttonType: ButtonType.outline,
                onTap: () {},
                child: const Icon(Icons.chat),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
