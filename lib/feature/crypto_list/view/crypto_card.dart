import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/router/router.gr.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Text'),
      onTap: () {
        context.router.push(const CoinDetailRoute());
      },
    );
  }
}
