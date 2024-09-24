class CryptoDetail {
  final String symbol;
  final String responseError;
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
    required this.responseError,
    required this.priceInUSD,
    required this.openDay,
    required this.highPriceLastHour,
    required this.lowPriceLastHour,
    required this.highPricePerDay,
    required this.lowPricePerDay,
    required this.percentagePriceHour,
    required this.percentagePriceDay,
  });

  factory CryptoDetail.empty() {
    return CryptoDetail(
      symbol: '',
      responseError: '',
      priceInUSD: 0.0,
      openDay: 0.0,
      highPriceLastHour: 0.0,
      lowPriceLastHour: 0.0,
      highPricePerDay: 0.0,
      lowPricePerDay: 0.0,
      percentagePriceHour: 0.0,
      percentagePriceDay: 0.0,
    );
  }

  factory CryptoDetail.fromJson(String symbol, Map<String, dynamic> json) {
    if (json.containsKey('Response') && json['Response'] == 'Error') {
      return CryptoDetail(
        symbol: symbol,
        responseError: json['Message'] ?? 'Unknown error',
        priceInUSD: 0.0,
        openDay: 0.0,
        highPriceLastHour: 0.0,
        lowPriceLastHour: 0.0,
        highPricePerDay: 0.0,
        lowPricePerDay: 0.0,
        percentagePriceHour: 0.0,
        percentagePriceDay: 0.0,
      );
    }

    if (json[symbol] != null && json[symbol]['USD'] != null) {
      final coinData = json[symbol]['USD'];
      return CryptoDetail(
        symbol: symbol,
        responseError: '',
        priceInUSD: (coinData['PRICE'] ?? 0.0).toDouble(),
        openDay: (coinData['OPENDAY'] ?? 0.0).toDouble(),
        highPriceLastHour: (coinData['HIGHHOUR'] ?? 0.0).toDouble(),
        lowPriceLastHour: (coinData['LOWHOUR'] ?? 0.0).toDouble(),
        highPricePerDay: (coinData['HIGHDAY'] ?? 0.0).toDouble(),
        lowPricePerDay: (coinData['LOWDAY'] ?? 0.0).toDouble(),
        percentagePriceHour: (coinData['CHANGEPCTHOUR'] ?? 0.0).toDouble(),
        percentagePriceDay: (coinData['CHANGEPCTDAY'] ?? 0.0).toDouble(),
      );
    } else {
      throw Exception('Data for symbol $symbol in USD not found');
    }
  }
}
