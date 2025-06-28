import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import 'package:taxi_app/core/widgets/w_button.dart';
import '../widgets/order_card.dart';

@RoutePage()
class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

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
            _activeDrivers(),
            const Center(child: Text('No Completed Drivers')),
            const Center(child: Text('No Cancelled Drivers')),
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

  Widget _activeDrivers() {
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
