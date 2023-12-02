import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({super.key});

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  String? _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: _data != null
          ? QrImageView(
              data: _data!,
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              // errorCorrectionLevel: QrErrorCorrectLevel.H,
            )
          : MobileScanner(
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
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                  setState(() => _data = barcode.rawValue);
                }
              },
            ),
    );
  }
}
