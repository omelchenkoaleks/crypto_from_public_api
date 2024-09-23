import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';
import 'package:crypto_from_public_api/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  late Future<List<CryptoCurrency>> cryptoList;

  @override
  void initState() {
    super.initState();
    cryptoList = fetchCryptoCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto List')),
      body: FutureBuilder<List<CryptoCurrency>>(
        future: cryptoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Список пуст'));
          } else {
            final cryptos = snapshot.data!;
            return ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (context, index) {
                final crypto = cryptos[index];
                return ListTile(
                  leading: Image.network(
                    crypto.imageUrl,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                  title: Text(crypto.name),
                  subtitle: Text(crypto.symbol),
                  onTap: () {
                    context.router
                        .push(CryptoDetailRoute(symbol: crypto.symbol));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<CryptoCurrency>> fetchCryptoCurrencies() async {
  const url = 'https://min-api.cryptocompare.com/data/all/coinlist';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);

    final Map<String, dynamic> data = json['Data'];
    final List<CryptoCurrency> cryptoList = [];

    data.forEach((key, value) {
      cryptoList.add(CryptoCurrency.fromJson(value));
    });

    return cryptoList;
  } else {
    throw Exception('Не удалось загрузить список валют');
  }
}
