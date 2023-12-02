import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_code_wallet/features/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.amber,
      Colors.cyan,
      Colors.teal,
      Colors.pink,
      Colors.purple,
    ];
    final color = colors[Random().nextInt(colors.length)];

    return MaterialApp(
      title: 'QRCode Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: ColorScheme.light(primary: color)),
      darkTheme: ThemeData.from(colorScheme: ColorScheme.dark(primary: color)),
      home: const HomePage(),
    );
  }
}
