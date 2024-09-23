class CryptoCurrency {
  final String symbol;
  final String name;
  final String imageUrl;
  final String description;
  final String url;

  CryptoCurrency({
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  CryptoCurrency.empty()
      : symbol = '',
        name = '',
        imageUrl = '',
        description = '',
        url = '';

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      symbol: json['Symbol'],
      name: json['CoinName'],
      imageUrl: 'https://www.cryptocompare.com${json['ImageUrl']}',
      description: json['Description'],
      url: 'https://www.cryptocompare.com${json['Url']}',
    );
  }
}
