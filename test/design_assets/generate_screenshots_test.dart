import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/theme/theme.dart';
import 'package:qr_code_wallet/features/details/qr_details_page.dart';
import 'package:qr_code_wallet/features/home/home_page.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';
import 'package:qr_code_wallet/features/settings/settings_page.dart';
import 'package:qr_code_wallet/features/settings/settings_repository.dart';
import 'package:qr_code_wallet/features/settings/state.dart';

void main() {
  const textStyle = TextStyle(
    fontSize: 96,
    color: Colors.white,
  );

  const qrCodes = [
    QRCode(
      id: 1,
      data: 'flutter',
      label: 'Flutter',
    ),
    QRCode(
      id: 1,
      data: 'WIFI:S:Dash;T:WPA;P:flutter;H:false',
      label: 'WiFi Login',
    ),
    QRCode(
      id: 1,
      data: 'dhl',
      label: 'DHL Return Label',
    ),
  ];

  late SettingsRepository mockSettingsRepository;

  setUp(() {
    mockSettingsRepository = _MockSettingsRepository();
    when(() => mockSettingsRepository.primaryColor).thenReturn(PrimaryColor.cyan);
  });

  generateAppStoreScreenshots(
    config: ScreenshotsConfig(
      devices: [DeviceType.androidPhonePortrait],
      locales: const [Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      background: ScreenshotBackground.solid(
        color: PrimaryColor.amber.color,
      ),
      theme: DarkTheme.generate(primaryColor: PrimaryColor.cyan.color),
      textStyle: textStyle,
    ),
    screens: [
      ScreenshotScenario(
        onBuildScreen: () => const HomePage(),
        wrapper: (child) => ProviderScope(
          overrides: [
            watchCodesProvider.overrideWith(
              (ref) => Stream.value(qrCodes),
            ),
          ],
          child: child,
        ),
      ),
      ScreenshotScenario(
        onBuildScreen: () => const QRDetailsPage(id: 1),
        wrapper: (child) => ProviderScope(
          overrides: [
            getQRCodeProvider.overrideWith(
              (ref) => qrCodes.first,
            ),
          ],
          child: child,
        ),
      ),
      ScreenshotScenario(
        onBuildScreen: () => const SettingsPage(),
        wrapper: (child) => ProviderScope(
          key: UniqueKey(),
          overrides: [
            settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
          ],
          child: child,
        ),
      ),
    ],
  );
}

class _MockSettingsRepository extends Mock implements SettingsRepository {}
