// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/strings.dart';
// import '../../../../core/widgets/custom_button.dart';
// import '../../bloc/ride_bloc.dart';
// import '../widgets/ride_option_card.dart';

// class RideBookingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => RideBloc()..add(SelectRideOption('Economy')), // Boshlang'ich holatni o'rnatamiz
//         child: BlocConsumer<RideBloc, RideState>(
//           listener: (context, state) {
//             print("Holat o'zgardi: $state"); // Holatni kuzatish
//           },
//           builder: (context, state) {
//             print('UI qurilmoqda holat: $state'); // UI qurilishini kuzatish
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     padding: const EdgeInsets.all(16),
//                     children: [
//                       const Text(AppStrings.whereTo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 16),
//                       Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
//                         ),
//                         child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on, color: AppColors.green),
//                                 SizedBox(width: 8),
//                                 Text('${AppStrings.from}: 123 Main Street, Downtown'),
//                               ],
//                             ),
//                             SizedBox(height: 16),
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on, color: AppColors.red),
//                                 SizedBox(width: 8),
//                                 Text(AppStrings.whereTo),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(AppStrings.chooseRide, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                       if (state is RideLoaded)
//                         Column(
//                           children: [
//                             RideOptionCard(
//                               title: 'Economy',
//                               details: '4 seats • 2 min away',
//                               price: state.price,
//                               isSelected: state.selectedOption == 'Economy',
//                               onTap: () {
//                                 print('Economy ni tanladik'); // Tapni tekshirish
//                                 context.read<RideBloc>().add(SelectRideOption('Economy'));
//                               },
//                             ),
//                             RideOptionCard(
//                               title: 'Comfort',
//                               details: '4 seats • 5 min away',
//                               price: 18.20,
//                               isSelected: state.selectedOption == 'Comfort',
//                               onTap: () => context.read<RideBloc>().add(SelectRideOption('Comfort')),
//                             ),
//                             RideOptionCard(
//                               title: 'Premium',
//                               details: '4 seats • 8 min away',
//                               price: 25.80,
//                               isSelected: state.selectedOption == 'Premium',
//                               onTap: () => context.read<RideBloc>().add(SelectRideOption('Premium')),
//                             ),
//                           ],
//                         )
//                       else if (state is RideLoading)
//                         const Center(child: CircularProgressIndicator()) // Yuklanishni aniq ko'rsatish
//                       else
//                         const Center(child: Text('Kutilmoqda...')), // Boshqa holatlar uchun
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/visa.png',
//                             height: 24,
//                             errorBuilder: (context, error, stackTrace) => const Icon(Icons.credit_card),
//                           ),
//                           const Text('•••• 4532'),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward_ios),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: CustomButton(
//                     text: AppStrings.bookRide,
//                     onPressed: () {
//                       print('BookRide bosildi'); // Button bosilishini tekshirish
//                       context.read<RideBloc>().add(BookRide());
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/location_card.dart';
import '../widgets/recent_trip_card.dart';
// import '../widgets/custom_bottom_nav.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class RideBookingScreen extends StatelessWidget {
  const RideBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            LocationInputSection(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LocationCard(
                  title: 'Home',
                  subtitle: '15 min away',
                  icon: Icons.home,
                  color: Colors.greenAccent,
                ),
                LocationCard(
                  title: 'Work',
                  subtitle: '22 min away',
                  icon: Icons.work,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'So\'nggi buyurtmalar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const RecentTripCard(
              from: 'Toshkent',
              to: 'Samarqand',
              date: '12-iyul, 10:00',
            ),
            const RecentTripCard(
              from: 'Andijon',
              to: 'Namangan',
              date: '13-iyul, 15:00',
            ),
          ],
        ),
      ),
    );
  }
}

class LocationInputSection extends StatefulWidget {
  @override
  _LocationInputSectionState createState() => _LocationInputSectionState();
}

class _LocationInputSectionState extends State<LocationInputSection> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  List<String> suggestions = [
    "Andijon viloyati",
    "Buxoro viloyati",
    "Fargʻona viloyati",
    "Jizzax viloyati",
    "Xorazm viloyati",
    "Namangan viloyati",
    "Navoiy viloyati",
    "Qashqadaryo viloyati",
    "Qoraqalpogʻiston Respublikasi",
    "Samarqand viloyati",
    "Sirdaryo viloyati",
    "Surxondaryo viloyati",
    "Toshkent viloyati",
  ];

  String fromInput = '';
  String toInput = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Where to?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.circle, size: 12, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: _buildCustomAutocomplete(
                  controller: _fromController,
                  hintText: "From",
                ),
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.grey),
          Row(
            children: [
              const Icon(Icons.circle, size: 12, color: Colors.red),
              const SizedBox(width: 8),
              Expanded(
                child: _buildCustomAutocomplete(
                  controller: _toController,
                  hintText: "Where to?",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAutocomplete({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return suggestions.where(
          (option) => option.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          ),
        );
      },
      onSelected: (String selection) {
        controller.text = selection;
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onEditingComplete,
      ) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: const Offset(-35, 0), // chapga 40px siljiydi
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width - 32,
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return ListTile(
                      title: Text(option),
                      onTap: () => onSelected(option),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
