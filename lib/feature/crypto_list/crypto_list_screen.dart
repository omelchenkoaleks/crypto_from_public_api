import 'package:crypto_from_public_api/feature/crypto_list/view/crypto_card.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CryptoCard(),
      ),
    );
  }
}
