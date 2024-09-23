// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:crypto_from_public_api/feature/crypto_detail/crypto_detail_screen.dart'
    as _i1;
import 'package:crypto_from_public_api/feature/crypto_list/crypto_list_screen.dart'
    as _i2;
import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart'
    as _i5;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.CryptoDetailScreen]
class CryptoDetailRoute extends _i3.PageRouteInfo<CryptoDetailRouteArgs> {
  CryptoDetailRoute({
    _i4.Key? key,
    required _i5.CryptoCurrency cryptoCurrency,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CryptoDetailRoute.name,
          args: CryptoDetailRouteArgs(
            key: key,
            cryptoCurrency: cryptoCurrency,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CryptoDetailRouteArgs>();
      return _i1.CryptoDetailScreen(
        key: args.key,
        cryptoCurrency: args.cryptoCurrency,
      );
    },
  );
}

class CryptoDetailRouteArgs {
  const CryptoDetailRouteArgs({
    this.key,
    required this.cryptoCurrency,
  });

  final _i4.Key? key;

  final _i5.CryptoCurrency cryptoCurrency;

  @override
  String toString() {
    return 'CryptoDetailRouteArgs{key: $key, cryptoCurrency: $cryptoCurrency}';
  }
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
