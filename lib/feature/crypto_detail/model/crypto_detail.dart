class CryptoDetail {
  final String symbol;
  final double priceInUSD;
  final double openDay;
  final double highPriceLastHour;
  final double lowPriceLastHour;
  final double highPricePerDay;
  final double lowPricePerDay;
  final double percentagePriceHour;
  final double percentagePriceDay;

  CryptoDetail({
    required this.symbol,
    required this.priceInUSD,
    required this.openDay,
    required this.highPriceLastHour,
    required this.lowPriceLastHour,
    required this.highPricePerDay,
    required this.lowPricePerDay,
    required this.percentagePriceHour,
    required this.percentagePriceDay,
  });

  factory CryptoDetail.fromJson(String symbol, Map<String, dynamic> json) {
    if (json[symbol] != null && json[symbol]['USD'] != null) {
      final coinData = json[symbol]['USD'];
      return CryptoDetail(
        symbol: symbol,
        priceInUSD: coinData['PRICE'].toDouble(),
        openDay: coinData['OPENDAY'].toDouble(),
        highPriceLastHour: coinData['HIGHHOUR'].toDouble(),
        lowPriceLastHour: coinData['LOWHOUR'].toDouble(),
        highPricePerDay: coinData['HIGHDAY'].toDouble(),
        lowPricePerDay: coinData['LOWDAY'].toDouble(),
        percentagePriceHour: coinData['CHANGEPCTHOUR'].toDouble(),
        percentagePriceDay: coinData['CHANGEPCTDAY'].toDouble(),
      );
    } else {
      print('Received JSON: $json');
      throw Exception('Data for symbol $symbol in USD not found');
    }
  }
}
