import 'dart:convert';

import 'package:crypto_from_public_api/feature/crypto_detail/model/crypto_detail.dart';
import 'package:http/http.dart' as http;

class CryptoDetailRepository {
  static const _baseUrl =
      'https://min-api.cryptocompare.com/data/pricemultifull';

  Future<CryptoDetail> fetchCryptoDetailWithUSD(String symbol) async {
    final url = '$_baseUrl?fsyms=$symbol&tsyms=USD';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load cryptocurrency data: ${response.statusCode}');
      }

      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['Response'] == 'Error') {
        return CryptoDetail.fromJson(symbol, json);
      }

      final rawData = json['RAW'];
      if (rawData == null) {
        throw Exception('The RAW field is missing in the response');
      }

      return CryptoDetail.fromJson(symbol, rawData);
    } catch (e) {
      throw Exception('An error occurred while fetching data: $e');
    }
  }
}
