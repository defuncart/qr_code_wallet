import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWidget extends StatelessWidget {
  const QRCodeWidget({
    super.key,
    required this.data,
    this.size,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String data;
  final double? size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: data,
      size: size,
      version: QrVersions.auto,
      // errorCorrectionLevel: QrErrorCorrectLevel.H,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: foregroundColor ?? Theme.of(context).colorScheme.onSurface,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: foregroundColor ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
