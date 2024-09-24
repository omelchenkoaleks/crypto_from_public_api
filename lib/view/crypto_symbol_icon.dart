import 'dart:math';

import 'package:flutter/material.dart';

class CryptoSymbolIcon extends StatelessWidget {
  final String symbol;

  const CryptoSymbolIcon({
    super.key,
    required this.symbol,
  });

  Color _generateColorFromSymbol(String symbol) {
    final random = Random(symbol.hashCode);
    return Color.fromARGB(
      150,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  String _formatSymbol(String symbol) {
    return symbol.length > 4
        ? '${symbol.substring(0, (symbol.length / 2).ceil())}\n${symbol.substring((symbol.length / 2).ceil())}'
        : symbol;
  }

  @override
  Widget build(BuildContext context) {
    final color = _generateColorFromSymbol(symbol);

    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(
        _formatSymbol(symbol),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
