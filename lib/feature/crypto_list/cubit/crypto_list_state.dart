import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';

class CryptoListState {
  final bool isLoading;
  final List<CryptoCurrency> cryptoCurrencies;

  CryptoListState({
    required this.isLoading,
    required this.cryptoCurrencies,
  });

  CryptoListState.initial()
      : isLoading = false,
        cryptoCurrencies = [];

  CryptoListState copyWith({
    bool? isLoading,
    List<CryptoCurrency>? cryptoCurrencies,
  }) {
    return CryptoListState(
      isLoading: isLoading ?? this.isLoading,
      cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
    );
  }
}
