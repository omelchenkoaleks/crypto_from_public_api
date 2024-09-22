// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:crypto_from_public_api/feature/coin_detail/coin_detail_screen.dart'
    as _i1;
import 'package:crypto_from_public_api/feature/crypto_list/crypto_list_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CoinDetailScreen]
class CoinDetailRoute extends _i3.PageRouteInfo<void> {
  const CoinDetailRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CoinDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoinDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.CoinDetailScreen();
    },
  );
}

/// generated route for
/// [_i2.CryptoListScreen]
class CryptoListRoute extends _i3.PageRouteInfo<void> {
  const CryptoListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CryptoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.CryptoListScreen();
    },
  );
}
