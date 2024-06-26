import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/widgets/qr_code_widget.dart';

class QRScannerWidget extends ConsumerStatefulWidget {
  static const path = '/scanner';

  const QRScannerWidget({super.key});

  @override
  ConsumerState<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends ConsumerState<QRScannerWidget> {
  String? _data;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.scannerTitle),
      ),
      body: _data != null
          ? Column(
              children: [
                QRCodeWidget(
                  data: _data!,
                  size: 200.0,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: context.l10n.scannerHint,
                    ),
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      ref.read(codesDbProvider).addEntry(
                            data: _data!,
                            label: _controller.text,
                          );
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
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
                  _focusNode.requestFocus();
                }
              },
            ),
    );
  }
}
