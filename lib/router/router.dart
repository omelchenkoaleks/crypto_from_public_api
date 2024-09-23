// final routers = {
//   '/': (context) => const CryptoListScreen(),
//   '/coinDetail': (context) => const CoinDetailScreen(),
// };

import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, path: '/'),
        AutoRoute(page: CryptoDetailRoute.page),
      ];
}
