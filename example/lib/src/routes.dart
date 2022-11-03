import 'package:example/common.dart';
import 'package:example/get_it_config.dart';
import 'package:example/src/services/auth_service.dart';

import 'pages/auth/auth_view.dart';
import 'pages/dashboard/_shell/view.dart';
import 'pages/dashboard/home/view.dart';
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

class AppRouteNames {
  static const initialRoute = '/';

  static const kHome = 'home';
  static const kAuth = 'auth';
  static const kDashboardHome = 'dashboard_home';
  static const kTransactions = 'transactions';

  static const kManage = 'manage';
  static const kManageServices = 'servicesettings';
  static const kManageOutlets = 'outletsettings';
  static const kManageEmployees = 'employeeSettings';

  static const kOutletHome = 'outlet';
  static const kTransactionsDetails = 'transactions_details';
  static const kPublicTransactionsDetails = 'public_transactions_details';
  static const kQueueSingleCustomer = 'queue_single_customer';
}

List<RouteBase> appRoutesList(GoRouterRefreshService goRouterRefreshService) =>
    [
      ShellRoute(
        navigatorKey: appShellNavigatorKey,
        builder: (context, state, child) => HookBuilder(
          builder: (context) {
            useRouterStateHook(
              routerState: state,
              keys: [state.location],
            );
            return child;
          },
        ),
        routes: [
          //auth page
          GoRoute(
            path: '/auth',
            name: AppRouteNames.kAuth,
            redirect: (context, state) {
              final authService = getIt<AuthService>();
              final isAuthed = authService.isAuthed.$;
              if (isAuthed) {
                final targetUri = state.queryParams[kReturnTo] ??
                    state.namedLocation(AppRouteNames.kDashboardHome);
                return targetUri;
              } else {
                return null;
              }
            },
            builder: (context, state) => HookBuilder(
              builder: (context) {
                return AuthView(controller: useViewController());
              },
            ),
          ),
          //public pages
          ShellRoute(
            navigatorKey: publicShellNavigatorKey,
            builder: (context, state, child) {
              return child;
            },
            routes: [
              GoRoute(
                path: '/',
                name: AppRouteNames.kHome,
                builder: (context, state) => HookBuilder(
                  builder: (context) => PublicHomeView(
                    controller: useViewController(),
                  ),
                ),
              ),
            ],
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
                  final authService = getIt<AuthService>();
                  final isAuthed = authService.isAuthed.$;

                  if (!isAuthed) {
                    final newUrl =
                        Uri.parse(state.namedLocation(AppRouteNames.kAuth))
                            .replace(
                      queryParameters: {
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
                    path: 'transactions',
                    name: AppRouteNames.kTransactions,
                    builder: (context, state) => HookBuilder(
                      builder: (context) => TransactionsView(
                        controller: useViewController(),
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: ':$kTransactionId',
                        name: AppRouteNames.kTransactionsDetails,
                        builder: (context, state) {
                          return HookBuilder(
                            builder: (context) {
                              useRouterStateHook(
                                routerState: state,
                                keys: [
                                  state.location,
                                ],
                              );
                              return TransactionDetailsView(
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
