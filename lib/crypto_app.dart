import 'package:crypto_from_public_api/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routers,
      navigatorObservers: [
        TalkerRouteObserver(
          GetIt.I<Talker>(),
        ),
      ],
    );
  }
}
