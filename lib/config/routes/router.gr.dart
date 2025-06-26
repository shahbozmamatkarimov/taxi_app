// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:taxi_app/features/driver/presentation/screens/driver_applications_screen.dart'
    as _i1;
import 'package:taxi_app/features/orders/presentation/screens/orders_screen.dart'
    as _i3;
import 'package:taxi_app/features/profile/presentation/screens/profile_screen.dart'
    as _i4;
import 'package:taxi_app/features/ride/presentation/screens/ride_booking_screen.dart'
    as _i5;
import 'package:taxi_app/home_screen.dart' as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DriverApplicationsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DriverApplicationsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OrdersScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreen(),
      );
    },
    RideBookingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RideBookingScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DriverApplicationsScreen]
class DriverApplicationsRoute extends _i6.PageRouteInfo<void> {
  const DriverApplicationsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DriverApplicationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverApplicationsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OrdersScreen]
class OrdersRoute extends _i6.PageRouteInfo<void> {
  const OrdersRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RideBookingScreen]
class RideBookingRoute extends _i6.PageRouteInfo<void> {
  const RideBookingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RideBookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RideBookingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
