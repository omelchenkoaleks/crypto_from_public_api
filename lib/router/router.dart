import 'package:crypto_from_public_api/feature/coin_detail/coin_detail_screen.dart';
import 'package:crypto_from_public_api/feature/crypto_list/crypto_list_screen.dart';

final routers = {
  '/': (context) => const CryptoListScreen(),
  '/coinDetail': (context) => const CoinDetailScreen(),
};
