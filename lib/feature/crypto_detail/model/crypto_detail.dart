class CryptoDetail {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;

  CryptoDetail({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
  });

  factory CryptoDetail.fromJson(String symbol, Map<String, dynamic> json) {
    if (json[symbol] != null && json[symbol]['USD'] != null) {
      final coinData = json[symbol]['USD'];
      return CryptoDetail(
        name: coinData['FROMSYMBOL'],
        symbol: symbol,
        imageUrl: 'https://www.cryptocompare.com${coinData['IMAGEURL']}',
        price: coinData['PRICE'].toDouble(),
      );
    } else {
      throw Exception('Данные для символа $symbol в USD не найдены');
    }
  }
}
