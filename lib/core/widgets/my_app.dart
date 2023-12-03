import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/features/home/home_page.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_widget.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final dbDir = await getApplicationSupportDirectory();
    ref.read(codesDbProvider).init(dbDir.path);
    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized ? const _MyApp() : const _FakeApp();
  }
}

class _FakeApp extends StatelessWidget {
  const _FakeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SizedBox.shrink(),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

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

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      scrollBehavior: _AppScrollBehavior(),
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
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: QRScannerWidget.path,
      builder: (context, state) => const QRScannerWidget(),
    ),
  ],
);

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
