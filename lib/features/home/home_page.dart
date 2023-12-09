import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/widgets/qr_code_widget.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_widget.dart';
import 'package:qr_code_wallet/features/settings/settings_page.dart';

class HomePage extends StatelessWidget {
  static const path = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            onPressed: () => context.push(SettingsPage.path),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const HomePageContent(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => context.push(QRScannerWidget.path),
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
          : ListView.builder(
              itemCount: data.value.length,
              itemBuilder: (context, index) => QRTile(
                qrCode: data.value[index],
                onDismiss: () => ref.read(codesDbProvider).removeEntry(data.value[index].id),
              ),
            ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

@visibleForTesting
class QRTile extends StatelessWidget {
  const QRTile({
    super.key,
    required this.qrCode,
    required this.onDismiss,
  });

  final QRCode qrCode;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('qrCode-${qrCode.id}'),
      background: const ColoredBox(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      child: ListTile(
        leading: QRCodeWidget(
          data: qrCode.data,
          size: 48,
          backgroundColor: Colors.transparent,
        ),
        title: Text(qrCode.label),
        onTap: () => showQRDialog(context, qrCode: qrCode),
      ),
    );
  }
}

Future<void> showQRDialog(
  BuildContext context, {
  required QRCode qrCode,
}) =>
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: QRCodeWidget(
          data: qrCode.data,
        ),
      ),
    );
