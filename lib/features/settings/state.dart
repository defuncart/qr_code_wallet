import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';
import 'package:qr_code_wallet/features/settings/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) => SettingsRepository();

@Riverpod(keepAlive: true)
class PrimaryColorController extends _$PrimaryColorController {
  @override
  PrimaryColor build() => ref.read(settingsRepositoryProvider).primaryColor;

  void set(PrimaryColor value) {
    if (state != value) {
      ref.read(settingsRepositoryProvider).primaryColor = value;
      state = value;
    }
  }
}
