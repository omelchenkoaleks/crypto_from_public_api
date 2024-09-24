import 'package:auto_route/auto_route.dart';
import 'package:crypto_from_public_api/feature/crypto_detail/cubit/crypto_detail_cubit.dart';
import 'package:crypto_from_public_api/feature/crypto_detail/cubit/crypto_detail_state.dart';
import 'package:crypto_from_public_api/feature/crypto_list/model/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class CryptoDetailScreen extends StatefulWidget {
  final CryptoCurrency cryptoCurrency;

  const CryptoDetailScreen({super.key, required this.cryptoCurrency});

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  @override
  void initState() {
    context
        .read<CryptoDetailCubit>()
        .fetchCryptoDetailWithUSD(widget.cryptoCurrency.symbol);
    super.initState();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Details for ${widget.cryptoCurrency.symbol}')),
      body: BlocBuilder<CryptoDetailCubit, CryptoDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.cryptoDetail.responseError.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'No currency pair with USD for: ${widget.cryptoCurrency.symbol} in USD!\nGo to the website to learn more about currency.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _launchURL(widget.cryptoCurrency.url);
                    },
                    child: Text('Go to the website'.toUpperCase()),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        widget.cryptoCurrency.imageUrl,
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(widget.cryptoCurrency.name,
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text('Symbol: ${state.cryptoDetail.symbol}',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(
                          'Price: \$${state.cryptoDetail.priceInUSD.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text('Symbol: ${widget.cryptoCurrency.description}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
