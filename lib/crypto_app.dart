import 'package:crypto_from_public_api/feature/crypto_list/cubit/crypto_list_cubit.dart';
import 'package:crypto_from_public_api/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  CryptoApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CryptoListCubit()..fetchFullCryptoListCurrencies(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(
              GetIt.I<Talker>(),
            ),
          ],
        ),
      ),
    );
  }
}
