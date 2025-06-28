// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:taxi_app/features/driver/presentation/screens/driver_applications_screen.dart'
    as _i1;
import 'package:taxi_app/features/drivers/presentation/screens/drivers_screen.dart'
    as _i2;
import 'package:taxi_app/features/map/presentation/screens/map_screen.dart'
    as _i4;
import 'package:taxi_app/features/orders/presentation/screens/orders_screen.dart'
    as _i5;
import 'package:taxi_app/features/profile/presentation/screens/profile_screen.dart'
    as _i6;
import 'package:taxi_app/features/ride/presentation/screens/ride_booking_screen.dart'
    as _i7;
import 'package:taxi_app/home_screen.dart' as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DriverApplicationsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DriverApplicationsScreen(),
      );
    },
    DriversRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DriversScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MapScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OrdersScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    RideBookingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RideBookingScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DriverApplicationsScreen]
class DriverApplicationsRoute extends _i8.PageRouteInfo<void> {
  const DriverApplicationsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DriverApplicationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriverApplicationsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DriversScreen]
class DriversRoute extends _i8.PageRouteInfo<void> {
  const DriversRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DriversRoute.name,
          initialChildren: children,
        );

  static const String name = 'DriversRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MapScreen]
class MapRoute extends _i8.PageRouteInfo<void> {
  const MapRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OrdersScreen]
class OrdersRoute extends _i8.PageRouteInfo<void> {
  const OrdersRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RideBookingScreen]
class RideBookingRoute extends _i8.PageRouteInfo<void> {
  const RideBookingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RideBookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RideBookingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
