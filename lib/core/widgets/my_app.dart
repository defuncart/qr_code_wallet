import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.from(colorScheme: ColorScheme.light(primary: color)),
      darkTheme: ThemeData.from(colorScheme: ColorScheme.dark(primary: color)),
      onGenerateTitle: (context) => context.l10n.appTitle,
      home: const HomePage(),
    );
  }
}
