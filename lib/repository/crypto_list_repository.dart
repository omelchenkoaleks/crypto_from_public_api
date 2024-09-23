import 'dart:convert';

import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:talker_flutter/talker_flutter.dart';

class CryptoListRepository {
  Future<List<CryptoCurrency>> getFullCryptoListCurrencies() async {
    const url = 'https://min-api.cryptocompare.com/data/all/coinlist';

    try {
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
        GetIt.I<Talker>().critical(
            'Failed to load crypto currencies. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to load crypto currencies in getFullCryptoListCurrencies()! Status code: ${response.statusCode}');
      }
    } catch (e) {
      GetIt.I<Talker>().error('Error in getFullCryptoListCurrencies(): $e');
      throw Exception('Failed to load crypto currencies due to error: $e');
    }
  }
}
