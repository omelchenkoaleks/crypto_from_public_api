class CryptoCurrency {
  static const String _baseUrl = 'https://www.cryptocompare.com';

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
      symbol: json['Symbol'] ?? '',
      name: json['CoinName'] ?? '',
      imageUrl: _buildImageUrl(json['ImageUrl']),
      description: json['Description'] ?? '',
      url: _buildUrlVisitWebsite(json['Url']),
    );
  }

  static String _buildImageUrl(String? imageUrl) {
    return imageUrl != null ? '$_baseUrl$imageUrl' : '';
  }

  static String _buildUrlVisitWebsite(String? url) {
    return url != null ? '$_baseUrl$url' : '';
  }
}
