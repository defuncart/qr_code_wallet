import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/widgets/qr_code_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
          // if (kDebugMode) Text(qrCode.data),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: qrCode.canLaunch ? 32 : 48,
            children: [
              IconButton(
                onPressed: () => Share.share(qrCode.data),
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () => Clipboard.setData(ClipboardData(text: qrCode.data)),
                icon: const Icon(Icons.copy),
              ),
              if (qrCode.canLaunch)
                IconButton(
                  onPressed: () => launchUrl(Uri.parse(qrCode.adjustedSchema)),
                  icon: Icon(qrCode.icon),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on QRCode {
  bool get canLaunch => switch (type) {
        QRCodeType.url => true,
        QRCodeType.email => true,
        QRCodeType.sms => true,
        QRCodeType.phone => true,
        _ => false,
      };

  String get adjustedSchema {
    if (type == QRCodeType.email) {
      // matmsg:TO:a@a.com;SUB:Title;BODY:Message;;
      // 'mailto:<email address>?subject=<subject>&body=<body>'
      final regex = RegExp(r':TO:([\w-\.]+@([\w-]+\.)+[\w-]{2,4});SUB:(.+);BODY:(.+)');
      final match = regex.allMatches(data);
      if (match.isNotEmpty) {
        final email = match.first.group(1);
        final subject = match.first.group(3);
        final body = match.first.group(4);

        return 'mailto:$email?subject=$subject&body=$body';
      }
    }

    return data;
  }

  IconData get icon => switch (type) {
        QRCodeType.url => Icons.open_in_browser,
        QRCodeType.email => Icons.email,
        QRCodeType.sms => Icons.sms,
        QRCodeType.phone => Icons.phone,
        _ => throw ArgumentError(),
      };
}
