import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_list/cubit/crypto_list_cubit.dart';
import 'package:crypto_from_public_api/feature/crypto_list/cubit/crypto_list_state.dart';
import 'package:crypto_from_public_api/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List'),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoListCubit, CryptoListState>(
        builder: (context, state) {
          if (state.isLoading && state.cryptoCurrencies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.cryptoCurrencies.isEmpty) {
            return const Center(child: Text('No crypto currencies available'));
          }

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ListView.builder(
              itemCount: state.cryptoCurrencies.length,
              itemBuilder: (context, item) {
                final cryptoCurrency = state.cryptoCurrencies[item];
                return ListTile(
                  leading: Image.network(
                    cryptoCurrency.imageUrl,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                  title: Text(cryptoCurrency.name),
                  subtitle: Text(cryptoCurrency.symbol),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    context.router.push(
                      CryptoDetailRoute(symbol: cryptoCurrency.symbol),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
