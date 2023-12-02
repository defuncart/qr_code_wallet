import 'package:isar/isar.dart';

part 'qr_code.g.dart';

@collection
class QRCode {
  const QRCode({
    required this.id,
    required this.data,
    required this.label,
    // this.title,
    // this.recipients,
    // this.status = Status.pending,
  });

  final int id;

  final String data;

  final String label;

  // @Index(type: IndexType.value)
  // final String? title;

  // final List<Recipient>? recipients;

  // final Status status;
}

// @embedded
// class Recipient {
//   String? name;

//   String? address;
// }

// enum Status {
//   draft,
//   pending,
//   sent,
// }
