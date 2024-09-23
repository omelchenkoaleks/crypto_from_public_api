class CryptoCurrency {
  final String symbol;
  final String name;
  final String imageUrl;

  CryptoCurrency({
    required this.symbol,
    required this.name,
    required this.imageUrl,
  });

  CryptoCurrency.empty()
      : symbol = '',
        name = '',
        imageUrl = '';

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      symbol: json['Symbol'],
      name: json['CoinName'],
      imageUrl: 'https://www.cryptocompare.com${json['ImageUrl']}',
    );
  }
}
