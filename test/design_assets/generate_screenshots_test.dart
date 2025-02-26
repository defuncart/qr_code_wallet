import 'package:app_store_screenshots/app_store_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/db/repositories/qr_db_repository.dart';
import 'package:qr_code_wallet/core/l10n/generated/localizations.dart';
import 'package:qr_code_wallet/core/state/state.dart';
import 'package:qr_code_wallet/core/theme/theme.dart';
import 'package:qr_code_wallet/features/details/qr_details_page.dart';
import 'package:qr_code_wallet/features/home/home_page.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';
import 'package:qr_code_wallet/features/settings/settings_page.dart';
import 'package:qr_code_wallet/features/settings/settings_repository.dart';
import 'package:qr_code_wallet/features/settings/state.dart';

void main() {
  const qrCodes = [
    QRCode(id: 1, type: QRCodeType.url, data: 'flutter.dev', label: 'Flutter'),
    QRCode(id: 1, type: QRCodeType.wifi, data: 'WIFI:S:Dash;T:WPA;P:flutter;H:false', label: 'WiFi Login'),
    QRCode(id: 1, type: QRCodeType.text, data: 'dhl', label: 'DHL Return Label'),
  ];
  const primaryColor = PrimaryColor.amber;

  late SettingsRepository mockSettingsRepository;
  late QRDBRepository mockQRDBRepository;

  setUp(() {
    mockSettingsRepository = _MockSettingsRepository();
    mockQRDBRepository = _MockQRDBRepository();
    when(() => mockSettingsRepository.primaryColor).thenReturn(primaryColor);
  });

  generateAppStoreScreenshots(
    config: ScreenshotsConfig(
      devices: [DeviceType.androidPhonePortrait],
      locales: const [Locale('en')],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      background: ScreenshotBackground.solid(color: primaryColor.color),
      theme: DarkTheme.generate(primaryColor: primaryColor.color),
      textOptions: const ScreenshotTextOptions(textStyle: TextStyle(fontSize: 96, color: Colors.white)),
    ),
    screens: [
      ScreenshotScenario(
        onBuildScreen: () => const HomePage(),
        wrapper: (child) => ProviderScope(
          overrides: [watchCodesProvider.overrideWith((ref) => Stream.value(qrCodes))],
          child: child,
        ),
      ),
      ScreenshotScenario(
        onSetUp: (_) {
          when(() => mockQRDBRepository.get(1)).thenReturn(qrCodes.first);
        },
        onBuildScreen: () => const QRDetailsPage(id: 1),
        wrapper: (child) => ProviderScope(
          overrides: [
            // workaround until watchCodesProvider.overrideWith lands in stable
            codesDbProvider.overrideWithValue(mockQRDBRepository),
          ],
          child: child,
        ),
      ),
      ScreenshotScenario(
        onBuildScreen: () => const SettingsPage(),
        wrapper: (child) => ProviderScope(
          key: UniqueKey(),
          overrides: [settingsRepositoryProvider.overrideWithValue(mockSettingsRepository)],
          child: child,
        ),
      ),
    ],
  );
}

class _MockSettingsRepository extends Mock implements SettingsRepository {}

class _MockQRDBRepository extends Mock implements QRDBRepository {}
