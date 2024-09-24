import 'package:crypto_from_public_api/feature/crypto_detail/model/crypto_detail.dart';

class CryptoDetailState {
  final bool isLoading;
  final CryptoDetail cryptoDetail;

  CryptoDetailState({
    required this.isLoading,
    required this.cryptoDetail,
  });

  CryptoDetailState.initial()
      : isLoading = false,
        cryptoDetail = CryptoDetail.empty();

  CryptoDetailState copyWith({
    bool? isLoading,
    CryptoDetail? cryptoDetail,
  }) {
    return CryptoDetailState(
      isLoading: isLoading ?? this.isLoading,
      cryptoDetail: cryptoDetail ?? this.cryptoDetail,
    );
  }
}
