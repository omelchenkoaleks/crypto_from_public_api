import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_detail/model/crypto_detail.dart';
import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
  final CryptoCurrency cryptoCurrency;

  const CryptoDetailScreen({super.key, required this.cryptoCurrency});

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  late Future<CryptoDetail> cryptoDetails;

  @override
  void initState() {
    super.initState();
    cryptoDetails = fetchCryptoDetails(widget.cryptoCurrency.symbol);
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Details for ${widget.cryptoCurrency.symbol}')),
      body: FutureBuilder<CryptoDetail>(
        future: cryptoDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ошибка: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(widget.cryptoCurrency.url);
                    },
                    child: const Text('Перейти на сайт'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Нет данных'));
          } else {
            final crypto = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(widget.cryptoCurrency.name,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text('Symbol: ${crypto.symbol}',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text('Price: \$${crypto.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text('Symbol: ${widget.cryptoCurrency.description}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
