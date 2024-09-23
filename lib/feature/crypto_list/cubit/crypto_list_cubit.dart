import 'package:crypto_from_public_api/feature/crypto_list/cubit/crypto_list_state.dart';
import 'package:crypto_from_public_api/repository/crypto_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoListCubit extends Cubit<CryptoListState> {
  CryptoListCubit() : super(CryptoListState.initial());
  final CryptoListRepository _repository = CryptoListRepository();

  Future<void> fetchFullCryptoListCurrencies() async {
    try {
      emit(state.copyWith(isLoading: true));

      final cryptoCurrencies = await _repository.getFullCryptoListCurrencies();

      emit(state.copyWith(
        isLoading: false,
        cryptoCurrencies: cryptoCurrencies,
      ));
    } catch (e) {
      GetIt.I<Talker>().error(
          'Error with CryptoListCubit on receipt full crypto list currencies: $e');

      emit(state.copyWith(isLoading: false));
    }
  }
}
