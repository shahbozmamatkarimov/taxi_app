// import 'package:flutter/material.dart';
// import 'package:taxi_app/home.dart';
// import 'config/routes/app_routes.dart';
// import 'features/ride/presentation/screens/ride_booking_screen.dart';
// import 'features/orders/presentation/screens/orders_screen.dart';
// import 'features/driver/presentation/screens/driver_applications_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BonVoyage',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: AppRoutes.home,
//       routes: {
//         AppRoutes.home: (context) => HomeScreen(),
//         AppRoutes.rideBooking: (context) => RideBookingScreen(),
//         AppRoutes.orders: (context) => OrdersScreen(),
//         AppRoutes.driverApplications: (context) => DriverApplicationsScreen(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:taxi_app/config/routes/router.dart';
import 'package:taxi_app/core/resources/app_colors.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb) {
  //   if (Platform.isWindows || Platform.isMacOS) {
  //     await windowManager.ensureInitialized();

  //     // Set window properties
  //     await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  //   }
  // }
  // await windowManager.ensureInitialized();

  // // Set window properties
  // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BonVoyage',
      debugShowCheckedModeBanner: false,
      color: AppColors.backgroundColor,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
          background: AppColors.backgroundColor,
        ),
        // useMaterial3: true,
      ),
      routerConfig: _router.config(),
      // routerDelegate: _router.delegate(),
      // routeInformationParser: _router.defaultRouteParser(),
    );
  }
}
