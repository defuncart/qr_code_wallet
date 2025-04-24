import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/widgets/qr_code_widget.dart';
import 'package:qr_code_wallet/features/qr_generator/qr_generator_page.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_page.dart';
import 'package:qr_code_wallet/features/settings/settings_page.dart';

class HomePage extends StatelessWidget {
  static const path = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [IconButton(onPressed: () => context.push(SettingsPage.path), icon: const Icon(Icons.settings))],
      ),
      body: const HomePageContent(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        initialOpen: false,
        type: ExpandableFabType.up,
        pos: ExpandableFabPos.right,
        distance: 65,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.qr_code_scanner, size: 64),
          fabSize: ExpandableFabSize.large,
          foregroundColor: Colors.white,
        ),
        overlayStyle: ExpandableFabOverlayStyle(color: Colors.black.withValues(alpha: 0.5)),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close, color: Colors.white),
          fabSize: ExpandableFabSize.small,
        ),
        children: [
          FloatingActionButton(
            child: const Icon(Icons.edit, color: Colors.white, size: 32),
            onPressed: () => context.push(QRGeneratorPage.path),
          ),
          FloatingActionButton(
            child: const Icon(Icons.photo_camera, color: Colors.white, size: 32),
            onPressed: () => context.push(QRScannerPage.path),
          ),
        ],
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

    return switch (codes) {
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(child: Text(context.l10n.homeNoSavedCodes))
            : ListView.builder(
              itemCount: value.length,
              itemBuilder:
                  (context, index) => QRTile(
                    qrCode: value[index],
                    onDismiss: () => ref.read(codesDbProvider).removeEntry(value[index].id),
                  ),
            ),
      _ => const SizedBox.shrink(),
    };
  }
}

@visibleForTesting
class QRTile extends StatelessWidget {
  const QRTile({super.key, required this.qrCode, required this.onDismiss});

  final QRCode qrCode;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('qrCode-${qrCode.id}'),
      background: const ColoredBox(color: Colors.red, child: Icon(Icons.delete, color: Colors.white)),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      child: ListTile(
        leading: QRCodeWidget(data: qrCode.data, size: 48, backgroundColor: Colors.transparent),
        title: Text(qrCode.label),
        onTap: () => context.push('/details/${qrCode.id}'),
      ),
    );
  }
}
