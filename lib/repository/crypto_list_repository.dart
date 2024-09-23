import 'dart:convert';

import 'package:crypto_from_public_api/model/crypto_currency.dart';
import 'package:http/http.dart' as http;

class CryptoListRepository {
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
}
