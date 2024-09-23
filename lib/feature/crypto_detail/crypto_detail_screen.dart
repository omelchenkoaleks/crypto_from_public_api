import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_detail/model/crypto_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<CryptoDetail> fetchCryptoDetails(String symbol) async {
  final url =
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$symbol&tsyms=USD';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final coinData = json['RAW'][symbol]['USD'];

    return CryptoDetail(
      name: coinData['FROMSYMBOL'],
      symbol: symbol,
      imageUrl: 'https://www.cryptocompare.com${coinData['IMAGEURL']}',
      price: coinData['PRICE'].toDouble(),
    );
  } else {
    throw Exception('Не удалось загрузить данные о валюте');
  }
}

@RoutePage()
class CryptoDetailScreen extends StatefulWidget {
  final String symbol;

  const CryptoDetailScreen({super.key, required this.symbol});

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  late Future<CryptoDetail> cryptoDetails;

  @override
  void initState() {
    super.initState();
    cryptoDetails = fetchCryptoDetails(widget.symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details for ${widget.symbol}')),
      body: FutureBuilder<CryptoDetail>(
        future: cryptoDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Нет данных'));
          } else {
            final crypto = snapshot.data!;
            return Column(
              children: [
                Image.network(
                  crypto.imageUrl,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                const SizedBox(height: 16),
                Text(crypto.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('Symbol: ${crypto.symbol}',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('Price: \$${crypto.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            );
          }
        },
      ),
    );
  }
}
