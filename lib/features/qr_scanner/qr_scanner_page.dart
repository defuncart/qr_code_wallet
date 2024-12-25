import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';

class QRScannerPage extends ConsumerStatefulWidget {
  static const path = '/scanner';

  const QRScannerPage({super.key});

  @override
  ConsumerState<QRScannerPage> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends ConsumerState<QRScannerPage> {
  ScannedCode? _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.scannerTitle),
      ),
      body: _data != null
          ? const SizedBox()
          : QRCodeScanner(
              onCodeScanned: (data) {
                if (_data == null) {
                  setState(() {
                    _data = data;
                  });

                  final label = _generatedLabelForData(data);
                  final id = ref.read(codesDbProvider).addEntry(
                        type: data.type,
                        data: data.rawValue,
                        label: label,
                        email: data.email,
                        phone: data.phone,
                        sms: data.sms,
                        wifi: data.wifi,
                      );

                  context.replace('/details/$id');
                }
              },
            ),
    );
  }

  String _generatedLabelForData(ScannedCode data) => switch (data.type) {
        QRCodeType.url => data.rawValue,
        QRCodeType.vCard => 'vCard',
        QRCodeType.text => data.rawValue,
        QRCodeType.email => 'email: ${data.email?.address} - ${data.email?.subject}',
        QRCodeType.phone => 'phone: ${data.phone?.phoneNumber}',
        QRCodeType.sms => 'sms: ${data.sms?.phoneNumber}',
        QRCodeType.wifi => 'wifi: ${data.wifi?.ssid}',
        QRCodeType.other => data.rawValue,
      };
}

typedef ScannedCode = ({
  String rawValue,
  QRCodeType type,
  EmailQRCodeData? email,
  PhoneQRCodeData? phone,
  SMSQRCodeData? sms,
  WifiQRCodeData? wifi,
});

class QRCodeScanner extends StatelessWidget {
  const QRCodeScanner({
    super.key,
    required this.onCodeScanned,
  });

  final void Function(ScannedCode) onCodeScanned;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      fit: BoxFit.contain,
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        torchEnabled: false,
        formats: [BarcodeFormat.qrCode],
      ),
      placeholderBuilder: (context, _) => ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      onDetect: (capture) {
        final barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          if (barcode.format == BarcodeFormat.qrCode && barcode.rawValue != null) {
            log('Barcode found! ${barcode.type}-${barcode.rawValue}');

            onCodeScanned(
              (
                rawValue: barcode.rawValue!,
                type: barcode.type.toQRCodeType(),
                email: barcode.toEmail(),
                phone: barcode.toPhone(),
                sms: barcode.toSMS(),
                wifi: barcode.toWifi(),
              ),
            );
            break;
          }
        }
      },
    );
  }
}

extension on BarcodeType {
  QRCodeType toQRCodeType() => switch (this) {
        BarcodeType.url => QRCodeType.url,
        BarcodeType.contactInfo => QRCodeType.vCard,
        BarcodeType.text => QRCodeType.text,
        BarcodeType.email => QRCodeType.email,
        BarcodeType.phone => QRCodeType.phone,
        BarcodeType.sms => QRCodeType.sms,
        BarcodeType.wifi => QRCodeType.wifi,
        _ => QRCodeType.other,
      };
}

extension on Barcode {
  EmailQRCodeData? toEmail() => EmailQRCodeData(
        address: email?.address,
        subject: email?.subject,
        body: email?.body,
      );

  PhoneQRCodeData? toPhone() => PhoneQRCodeData(
        phoneNumber: phone?.number,
      );

  SMSQRCodeData? toSMS() => SMSQRCodeData(
        phoneNumber: sms?.phoneNumber,
        message: sms?.message,
      );

  WifiQRCodeData? toWifi() => WifiQRCodeData(
        ssid: wifi?.ssid,
        password: wifi?.password,
        encryption: wifi?.encryptionType.name,
      );
}
