import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';
import 'package:crypto_from_public_api/router/router.gr.dart';
import 'package:crypto_from_public_api/view/crypto_symbol_icon.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCurrency cryptoCurrency;
  const CryptoCard({
    super.key,
    required this.cryptoCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: cryptoCurrency.imageUrl.isNotEmpty
          ? Image.network(
              cryptoCurrency.imageUrl,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            )
          : CryptoSymbolIcon(symbol: cryptoCurrency.symbol),
      title: Text(cryptoCurrency.name),
      subtitle: Text(cryptoCurrency.symbol),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        context.router.push(
          CryptoDetailRoute(cryptoCurrency: cryptoCurrency),
        );
      },
    );
  }
}
