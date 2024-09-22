import 'package:crypto_from_public_api/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  CryptoApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            GetIt.I<Talker>(),
          ),
        ],
      ),
    );
  }
}
