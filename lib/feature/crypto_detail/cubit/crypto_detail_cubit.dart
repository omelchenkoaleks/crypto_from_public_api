import 'package:crypto_from_public_api/feature/crypto_detail/cubit/crypto_detail_state.dart';
import 'package:crypto_from_public_api/repository/crypto_detail_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoDetailCubit extends Cubit<CryptoDetailState> {
  CryptoDetailCubit() : super(CryptoDetailState.initial());
  final CryptoDetailRepository _repository = CryptoDetailRepository();

  Future<void> fetchCryptoDetailWithUSD(String symbol) async {
    try {
      emit(state.copyWith(isLoading: true));

      final cryptoDetailList =
          await _repository.fetchCryptoDetailWithUSD(symbol);

      emit(state.copyWith(
        isLoading: false,
        cryptoDetail: cryptoDetailList,
      ));
    } catch (e, stacktrace) {
      GetIt.I<Talker>()
          .error('Error with CryptoDetailCubit on receipt USD price: $e');
      GetIt.I<Talker>().log('Stacktrace: $stacktrace');

      emit(state.copyWith(isLoading: false));
    }
  }
}
