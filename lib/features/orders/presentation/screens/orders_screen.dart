// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taxi_app/features/orders/bloc/orders_bloc.dart';
// import 'package:taxi_app/features/ride/bloc/ride_bloc.dart';
// import 'package:taxi_app/features/ride/presentation/widgets/ride_option_card.dart';
// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/strings.dart';
// import '../../../../core/widgets/custom_button.dart';

// class OrdersScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => OrdersBloc()..add(FetchOrders()),
//         child: BlocConsumer<OrdersBloc, OrdersState>(
//           listener: (context, state) {
//             print('Holat o\'zgardi: $state');
//           },
//           builder: (context, state) {
//             print('UI qurilmoqda holat: ${state.runtimeType} - $state');
//             if (state is OrdersLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state is OrdersLoaded) {
//               return Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: state.orders.length,
//                   itemBuilder: (context, index) {
//                     final order = state.orders[index] ?? {};
//                     print('Order[$index]: $order');
//                     return Card(
//                       margin: const EdgeInsets.symmetric(vertical: 8),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   order['status'] != null
//                                       ? (order['status'] == 'Pending'
//                                           ? 'Pending'
//                                           : 'Accepted')
//                                       : 'Unknown',
//                                   style: TextStyle(
//                                     color:
//                                         order['status'] == 'Pending'
//                                             ? Colors.orange
//                                             : AppColors.green,
//                                   ),
//                                 ),
//                                 Text(
//                                   '#${order['id'] ?? 'N/A'}',
//                                   style: TextStyle(color: AppColors.grey),
//                                 ),
//                                 Text(order['date'] ?? 'N/A'),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Icon(Icons.flight_land, color: AppColors.blue),
//                                 const SizedBox(width: 8),
//                                 Expanded(
//                                   child: Text(order['from'] ?? 'Unknown'),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on, color: AppColors.green),
//                                 const SizedBox(width: 8),
//                                 Expanded(child: Text(order['to'] ?? 'Unknown')),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               children: [
//                                 Text(
//                                   '${order['passengers'] ?? 0} passengers  ${order['luggage'] == true ? 'Yes' : 'No'}',
//                                 ),
//                                 const Spacer(),
//                                 Text('${order['price'] ?? 0} UZS'),
//                               ],
//                             ),
//                             if (order['status'] == 'Pending')
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 8),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Flexible(
//                                       // Use Flexible to avoid ParentDataWidget error
//                                       child: CustomButton(
//                                         text: AppStrings.viewApplications,
//                                         onPressed: () {},
//                                         color: AppColors.primary,
//                                       ),
//                                     ),
//                                     Flexible(
//                                       // Use Flexible to avoid ParentDataWidget error
//                                       child: CustomButton(
//                                         text: AppStrings.cancel,
//                                         onPressed: () {},
//                                         color: AppColors.red,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             if (order['status'] == 'Accepted' &&
//                                 order['driver'] != null)
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 8),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           backgroundImage: const NetworkImage(
//                                             'https://via.placeholder.com/40',
//                                           ),
//                                           onBackgroundImageError:
//                                               (exception, stackTrace) =>
//                                                   const Icon(Icons.person),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Flexible(
//                                           // Use Flexible to constrain the column
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 '${order['driver']['name'] ?? 'Unknown'} ★${order['driver']['rating'] ?? 0.0}',
//                                               ),
//                                               Text(
//                                                 '${order['driver']['car'] ?? 'N/A'} • ${order['driver']['plate'] ?? 'N/A'}',
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Flexible(
//                                           child: CustomButton(
//                                             text: AppStrings.trackTrip,
//                                             onPressed: () {},
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                         Flexible(
//                                           child: CustomButton(
//                                             text: AppStrings.cancel,
//                                             onPressed: () {},
//                                             color: AppColors.red,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }
//             if (state is OrdersError) {
//               return Center(child: Text(state.message));
//             }
//             return const Center(child: Text('Kutilmoqda...'));
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add, color: AppColors.white),
//         backgroundColor: AppColors.primary,
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import 'package:taxi_app/core/widgets/w_button.dart';
import '../widgets/order_card.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Active (2)'),
                Tab(text: 'Completed (0)'),
                Tab(text: 'Cancelled (2)'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _activeOrders(),
            const Center(child: Text('No Completed Orders')),
            const Center(child: Text('No Cancelled Orders')),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          height: 68,
          child: WButton(
            text: "Create a new order",
            onTap: () => context.router.pushNamed('/home'),
            verticalPadding: 8,
            color: AppColors.blue,
            textColor: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _activeOrders() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        OrderCard(
          status: 'Pending',
          orderId: 'ORD-001',
          dateTime: '15 Jul, 08:30',
          from: 'Tashkent International Airport\nTerminal 2, Arrival Hall',
          to: 'Mirzo Ulugbek District\nBuyuk Ipak Yoli Street',
          passengers: '2 passengers',
          luggage: 'Yes',
          price: '120,000 UZS',
          footerText: '3 drivers applied',
          isAccepted: false,
        ),
        SizedBox(height: 32),
        OrderCard(
          status: 'Accepted',
          orderId: 'ORD-002',
          dateTime: '16 Jul, 14:00',
          from: 'Chilanzar Metro Station\nExit A, Near McDonald\'s',
          to: 'Samarkand\nRegistan Square',
          passengers: '1 passenger',
          luggage: 'No',
          price: '250,000 UZS',
          driverInfo: DriverInfo(
            name: 'Akmal Karimov',
            rating: 4.8,
            car: 'Chevrolet Cobalt • White • 01A123BC',
          ),
          isAccepted: true,
        ),
      ],
    );
  }
}
