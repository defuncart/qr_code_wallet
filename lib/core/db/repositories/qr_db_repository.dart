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

  int addEntry({
    required QRCodeType type,
    required String label,
    required String data,
    EmailQRCodeData? email,
    PhoneQRCodeData? phone,
    SMSQRCodeData? sms,
    WifiQRCodeData? wifi,
  }) {
    final id = _isar.qRCodes.autoIncrement();

    _isar.write((isar) {
      isar.qRCodes.put(
        QRCode(
          id: id,
          type: type,
          label: label,
          data: data,
          email: email,
          phone: phone,
          sms: sms,
          wifi: wifi,
        ),
      );
    });

    return id;
  }

  void removeEntry(int id) => _isar.write((isar) {
        isar.qRCodes.delete(id);
      });
}
