import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';

class QRDBRepository {
  late Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.open(
      schemas: [QRCodeSchema],
      directory: dir.path,
      engine: IsarEngine.isar,
    );
  }

  Stream<List<QRCode>> watch() => _isar.qRCodes.where().watch();

  void addEntry({
    required String data,
    required String label,
  }) =>
      _isar.write((isar) {
        isar.qRCodes.put(
          QRCode(
            id: _isar.qRCodes.autoIncrement(),
            data: data,
            label: label,
          ),
        );
      });

  void removeEntry(int id) => _isar.qRCodes.delete(id);
}
