import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_wallet/core/l10n/l10n_extension.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/theme/theme.dart';
import 'package:qr_code_wallet/features/details/qr_details_page.dart';
import 'package:qr_code_wallet/features/home/home_page.dart';
import 'package:qr_code_wallet/features/qr_scanner/qr_scanner_page.dart';
import 'package:qr_code_wallet/features/settings/settings_page.dart';
import 'package:qr_code_wallet/features/settings/state.dart';

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
    Hive.defaultDirectory = dbDir.path;
    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized ? const _MyApp() : const _FakeApp();
  }
}

class _FakeApp extends StatelessWidget {
  const _FakeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.generate(),
      darkTheme: DarkTheme.generate(),
      home: const SizedBox.shrink(),
    );
  }
}

class _MyApp extends ConsumerWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorControllerProvider).color;

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const _AppScrollBehavior(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: LightTheme.generate(primaryColor: color),
      darkTheme: DarkTheme.generate(primaryColor: color),
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
      path: SettingsPage.path,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: QRScannerPage.path,
      builder: (context, state) => const QRScannerPage(),
    ),
    GoRoute(
      path: QRDetailsPage.path,
      builder: (context, state) => QRDetailsPage(
        id: int.tryParse(state.pathParameters['id']!)!,
      ),
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
