import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
      ),
      body: const HomePageContent(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const QRScannerWidget(),
          ),
        ),
        child: Icon(
          Icons.qr_code_scanner,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 64,
        ),
      ),
    );
  }
}

@visibleForTesting
class HomePageContent extends ConsumerWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(watchCodesProvider);

    return codes.maybeMap(
      data: (data) => data.value.isEmpty
          ? Center(
              child: Text(context.l10n.homeNoSavedCodes),
            )
          : ListView(),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
