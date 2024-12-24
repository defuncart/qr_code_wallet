import 'package:isar/isar.dart';

part 'qr_code.g.dart';

@collection
class QRCode {
  const QRCode({
    required this.id,
    required this.type,
    required this.data,
    required this.label,
  });

  final int id;
  final QRCodeType type;
  final String data;
  final String label;
}

enum QRCodeType {
  url,
  vCard,
  text,
  email,
  phone,
  sms,
  wifi,
  other,
}
