import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';

void main() {
  generateAppIcon(
    onBuildIcon: () => const AppIcon(
      size: 512,
    ),
  );

  generateAppIconAndroidForeground(
    onBuildIcon: () => const AppIcon(
      size: 512 - 40 * 2,
      hasTransparentBackground: true,
    ),
    padding: const EdgeInsets.all(40),
  );
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.size,
    this.hasTransparentBackground = false,
  });

  final double size;
  final bool hasTransparentBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: hasTransparentBackground ? Colors.transparent : PrimaryColor.cyan.color,
      child: Center(
        child: Icon(
          Icons.qr_code,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }
}
