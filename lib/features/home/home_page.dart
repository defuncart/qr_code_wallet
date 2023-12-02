import 'package:flutter/material.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Wallet'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
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
