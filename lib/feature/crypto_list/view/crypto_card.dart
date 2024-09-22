import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Text'),
      onTap: () {
        Navigator.of(context).pushNamed('/coinDetail');
      },
    );
  }
}
