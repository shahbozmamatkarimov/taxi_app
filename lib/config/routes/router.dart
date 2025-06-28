import 'package:auto_route/auto_route.dart';
import 'package:taxi_app/config/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   page: OnBoardingRoute.page,
    //   path: '/',
    //   initial: true,
    // ),
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      // initial: true,
      children: [
        AutoRoute(
          page: RideBookingRoute.page,
          path: 'home',
          // initial: true,
        ),
        AutoRoute(page: OrdersRoute.page, path: 'orders'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
        AutoRoute(page: DriversRoute.page, path: 'drivers'),
        AutoRoute(page: MapRoute.page, path: 'map'),
      ],
    ),
    // settings
    // AutoRoute(
    //   page: InviteRoute.page,
    //   path: '/invite',
    // ),
    // AutoRoute(
    //   page: GeneralRoute.page,
    //   path: '/general',
    // ),
    // AutoRoute(
    //   page: SubscriptionsRoute.page,
    //   path: '/subscriptions',
    // ),
    // AutoRoute(
    //   page: CategoriesRoute.page,
    //   path: '/categories',
    // ),
    // AutoRoute(
    //   page: MetricsRoute.page,
    //   path: '/metrics',
    // ),
    // AutoRoute(
    //   page: GamificationRoute.page,
    //   path: '/gamification',
    // ),
    // AutoRoute(
    //   page: DiscoveryRoute.page,
    //   path: '/discovery',
    // ),
    // AutoRoute(
    //   page: LinksRoute.page,
    //   path: '/links',
    // ),
    // AutoRoute(
    //   page: BillingRoute.page,
    //   path: '/billing',
    // ),
    // // settings routes end
    // // profile routes
    // AutoRoute(
    //   page: SettingsRoute.page,
    //   path: '/settings',
    // ),
    // AutoRoute(
    //   page: ProfileRoute.page,
    //   path: '/profile',
    // ),
    // AutoRoute(
    //   page: AccountRoute.page,
    //   path: '/account',
    // ),
    // AutoRoute(
    //   page: PasswordRoute.page,
    //   path: '/password',
    // ),
    // AutoRoute(
    //   page: NotificationRoute.page,
    //   path: '/notifications',
    // ),
    // AutoRoute(
    //   page: ChatRoute.page,
    //   path: '/chat',
    // ),
    // AutoRoute(
    //   page: CommunityRoute.page,
    //   path: '/community',
    // ),
    // AutoRoute(
    //   page: ReferralsRoute.page,
    //   path: '/referrals',
    // ),
    // AutoRoute(
    //   page: PaymentMethodsRoute.page,
    //   path: '/paymentmethods',
    // ),
    // AutoRoute(
    //   page: PaymentHistoryRoute.page,
    //   path: '/paymenthistory',
    // ),
    // // profile routes end
    // // profile menu
    // CustomRoute(
    //   page: ProfileMenuRoute.page,
    //   path: '/profilemenu',
    //   transitionsBuilder: TransitionsBuilders.slideLeft,
    //   durationInMilliseconds: 150,
    // ),
    // AutoRoute(
    //   path: '/',
    //   page: MainRoute.page,
    //   children: [
    //     AutoRoute(
    //       path: 'communty',
    //       page: CommunityTabRoute.page,
    //       initial: true,
    //     ),
    //     AutoRoute(
    //       path: 'search',
    //       page: SearchRoute.page,
    //     ),
    //     AutoRoute(
    //       path: 'notifications',
    //       page: NotificationRoute.page,
    //     ),
    //     AutoRoute(
    //       path: 'chat',
    //       page: ChatRoute.page,
    //     ),
    //     AutoRoute(
    //       path: 'myprofile',
    //       page: MyProfileRoute.page,
    //     ),
    //   ],
    // ),
    // AutoRoute(path: '/login', page: LoginRoute.page),
  ];
}
