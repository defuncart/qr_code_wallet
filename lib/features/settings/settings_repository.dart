import 'package:hive/hive.dart';
import 'package:qr_code_wallet/features/settings/primary_color.dart';

class SettingsRepository {
  late final Box<dynamic> _box;
  static const _name = 'settings';

  SettingsRepository() {
    _box = Hive.box<dynamic>(name: _name);
  }

  PrimaryColor get primaryColor {
    try {
      final index = _box.get(_Keys.primaryColor) as int;
      return PrimaryColor.values[index];
    } catch (_) {
      return _Defaults.primaryColor;
    }
  }

  set primaryColor(PrimaryColor value) => _box.put(_Keys.primaryColor, value.index);
}

class _Keys {
  _Keys._();

  static const primaryColor = 'primaryColor';
}

class _Defaults {
  _Defaults._();

  static const primaryColor = PrimaryColor.cyan;
}
