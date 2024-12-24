import 'package:isar/isar.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';

class QRDBRepository {
  late final Isar _isar;

  void init(String directory) {
    _isar = Isar.open(
      schemas: [QRCodeSchema],
      directory: directory,
      engine: IsarEngine.isar,
    );
  }

  Stream<List<QRCode>> watch() => _isar.qRCodes.where().watch(fireImmediately: true);

  QRCode? get(int id) => _isar.qRCodes.get(id);

  void addEntry({
    required QRCodeType type,
    required String data,
    required String label,
  }) =>
      _isar.write((isar) {
        isar.qRCodes.put(
          QRCode(
            id: _isar.qRCodes.autoIncrement(),
            type: type,
            data: data,
            label: label,
          ),
        );
      });

  void removeEntry(int id) => _isar.write((isar) {
        isar.qRCodes.delete(id);
      });
}
