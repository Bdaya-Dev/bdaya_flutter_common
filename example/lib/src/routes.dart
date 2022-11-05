import 'package:example/common.dart';

import 'pages/auth/auth_view.dart';
import 'pages/dashboard/_shell/view.dart';
import 'pages/dashboard/home/view.dart';
import 'pages/dashboard/order_details/view.dart';
import 'pages/dashboard/orders/view.dart';
import 'pages/public/home/view.dart';

final appShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'appShell',
);
final dashboardShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'dashboardShell',
);
final publicShellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'publicShell',
);

const kReturnTo = 'returnTo';
const kOrderId = 'orderId';

class AppRouteNames {
  static const initialRoute = '/';

  static const kPublicHome = 'public_home';
  static const kAuth = 'auth';
  static const kDashboardHome = 'dashboard_home';
  static const kOrders = 'orders';
  static const kOrderDetails = 'order_details';
}

List<RouteBase> appRoutesList(GoRouterRefreshService goRouterRefreshService) =>
    [
      ShellRoute(
        navigatorKey: appShellNavigatorKey,
        builder: (context, state, child) => HookBuilder(
          builder: (context) => child,
        ),
        routes: [
          //public pages
          ShellRoute(
            navigatorKey: publicShellNavigatorKey,
            builder: (context, state, child) {
              return child;
            },
            routes: [
              GoRoute(
                path: '/',
                name: AppRouteNames.kPublicHome,
                builder: (context, state) => HookBuilder(
                  builder: (context) => PublicHomeView(
                    controller: useViewController(),
                  ),
                ),
              ),
            ],
          ),
          //auth page
          GoRoute(
            path: '/auth',
            name: AppRouteNames.kAuth,
            redirect: (context, state) {
              final authService = getIt<AuthService>();
              final goRouter = getIt<GoRouter>();
              final isAuthed = authService.isAuthed.$;
              if (isAuthed) {
                final targetUri = state.queryParams[kReturnTo] ??
                    goRouter.namedLocation(AppRouteNames.kDashboardHome);
                return targetUri;
              } else {
                return null;
              }
            },
            builder: (context, state) => HookBuilder(
              builder: (context) => AuthView(controller: useViewController()),
            ),
          ),

          // dashboard pages
          ShellRoute(
            navigatorKey: dashboardShellNavigatorKey,
            builder: (context, state, child) {
              return HookBuilder(
                builder: (context) => DashboardShellView(
                  controller: useViewController(),
                  child: child,
                ),
              );
            },
            routes: [
              GoRoute(
                path: '/dashboard',
                name: AppRouteNames.kDashboardHome,
                redirect: (context, state) {
                  final router = GoRouter.of(context);
                  final authService = getIt<AuthService>();
                  final isAuthed = authService.isAuthed.$;

                  if (!isAuthed) {
                    final newUrl = router.namedLocation(
                      AppRouteNames.kAuth,
                      queryParams: {
                        kReturnTo: state.location,
                      },
                    );
                    return newUrl.toString();
                  }
                  return null;
                },
                builder: (context, state) => HookBuilder(
                  builder: (context) => DashboardHomeView(
                    controller: useViewController(),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'orders',
                    name: AppRouteNames.kOrders,
                    builder: (context, state) => HookBuilder(
                      builder: (context) => OrdersView(
                        controller: useViewController(),
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: ':$kOrderId',
                        name: AppRouteNames.kOrderDetails,
                        builder: (context, state) {
                          return HookBuilder(
                            builder: (context) {
                              return OrderDetailsView(
                                controller: useViewController(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ];
