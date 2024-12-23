import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/widgets/qr_code_widget.dart';
import 'package:share_plus/share_plus.dart';

class QRDetailsPage extends ConsumerWidget {
  static const path = '/details/:id';

  const QRDetailsPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrCode = ref.watch(getQRCodeProvider(id: id));

    if (qrCode == null) {
      return Scaffold(
        appBar: AppBar(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(qrCode.label),
      ),
      body: Column(
        children: [
          QRCodeWidget(data: qrCode.data),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => Share.share(qrCode.data),
                icon: const Icon(Icons.share),
              ),
              const SizedBox(width: 48),
              IconButton(
                onPressed: () => Clipboard.setData(ClipboardData(text: qrCode.data)),
                icon: const Icon(Icons.copy),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
