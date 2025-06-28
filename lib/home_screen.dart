// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:taxi_app/core/resources/app_colors.dart';
// import 'package:taxi_app/core/constants/strings.dart';
// import 'package:taxi_app/features/orders/presentation/screens/orders_screen.dart';
// import 'package:taxi_app/features/profile/presentation/screens/profile_screen.dart';
// import 'package:taxi_app/features/ride/presentation/screens/ride_booking_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     RideBookingScreen(),
//     OrdersScreen(),
//     ProfileScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             SvgPicture.asset('assets/logo.svg', height: 30),
//             const SizedBox(width: 8),
//             Text(
//               AppStrings.appName,
//               style: const TextStyle(color: AppColors.secondary),
//             ),
//           ],
//         ),
//         actions: [
//           CircleAvatar(
//             backgroundImage: NetworkImage('https//via.placeholder.com/40'),
//           ),
//         ],
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         selectedItemColor: AppColors.blue,
//         unselectedItemColor: AppColors.grey,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance_wallet),
//             label: 'Wallet',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/config/routes/router.gr.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import 'package:taxi_app/core/util/responsive.dart';
import 'package:taxi_app/core/widgets/w_bottom_bar_item.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<String>> bottonNavItems = [
    ["home", "Home"],
    ["orders", "Orders"],
    ["wallet", "Drivers"],
    ["profile", "Profile"],
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        RideBookingRoute(),
        OrdersRoute(),
        DriversRoute(),
        ProfileRoute(),
        MapRoute(),
      ],
      transitionBuilder:
          (context, child, animation) =>
              FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          key: _scaffoldKey,
          drawer: const Drawer(
            width: 270,
            backgroundColor: AppColors.white,
            child: AppDrawer(),
          ),
          appBar: AppBar(
            title: Row(
              children: [
                SvgPicture.asset('assets/logo.svg', height: 30),
                const SizedBox(width: 8),
                Text(
                  "VonBoyage",
                  style: const TextStyle(color: AppColors.secondary),
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                backgroundImage: NetworkImage('https//via.placeholder.com/40'),
              ),
            ],
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(25),
                topEnd: Radius.circular(25),
              ),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int index = 0; index < bottonNavItems.length; index++)
                  WBottomBarItem(
                    icon:
                        "assets/svg/bottomnav/${bottonNavItems[index][0]}.svg",
                    label: bottonNavItems[index][1],
                    isActive: tabsRouter.activeIndex == index,
                    onTap:
                        () => {
                          tabsRouter.setActiveIndex(index),
                          // if (index == 0)
                          //   {context.router.pushNamed("/home")}
                          // else if (index == 1)
                          //   {context.router.pushNamed('/home/orders')}
                          // else if (index == 2)
                          //   {context.router.pushNamed('/home/wallet')}
                          // else if (index == 3)
                          //   {context.router.pushNamed("/home/profile")},
                          // // activeBottomNav = index
                          // setState(() {
                          //   activeBottomNav = index;
                          // })
                        },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Profile
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'), // Replace with actual photo
                    radius: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Sarah Johnson', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('sarah@example.com', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Switch Account Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: Column(
                  children: [
                    // User Account selected
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.deepPurple),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      label: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('User Account'),
                          SizedBox(width: 5),
                          Icon(Icons.check, size: 18),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Driver Account
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.directions_car),
                      label: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Driver Account'),
                          // SizedBox(width: 5),
                          // Icon(Icons.check, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Menu Items
              drawerItem(icon: Icons.history, text: "Your trips", onTap: () {}),
              drawerItem(icon: Icons.credit_card, text: "Payment", onTap: () {}),
              drawerItem(icon: Icons.card_giftcard, text: "Promotions", onTap: () {}),
              drawerItem(icon: Icons.settings, text: "Settings", onTap: () {}),
              drawerItem(icon: Icons.help_outline, text: "Help", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text),
      onTap: onTap,
    );
  }
}