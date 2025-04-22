import 'package:isar/isar.dart';

part 'qr_code.g.dart';

@collection
class QRCode {
  const QRCode({
    required this.id,
    required this.type,
    required this.label,
    required this.data,
    this.email,
    this.phone,
    this.sms,
    this.wifi,
  });

  final int id;
  final QRCodeType type;
  final String label;
  final String data;
  final EmailQRCodeData? email;
  final PhoneQRCodeData? phone;
  final SMSQRCodeData? sms;
  final WifiQRCodeData? wifi;
}

enum QRCodeType { url, vCard, text, email, phone, sms, wifi, other }

interface class QRCodeData {}

// url_launcher does not launch contact details, so ignore vCard for now

@embedded
class EmailQRCodeData implements QRCodeData {
  EmailQRCodeData({this.address, this.subject, this.body});

  String? address;
  String? subject;
  String? body;
}

@embedded
class PhoneQRCodeData implements QRCodeData {
  PhoneQRCodeData({this.phoneNumber});

  String? phoneNumber;
}

@embedded
class SMSQRCodeData implements QRCodeData {
  SMSQRCodeData({this.phoneNumber, this.message});

  String? phoneNumber;
  String? message;
}

@embedded
class WifiQRCodeData implements QRCodeData {
  WifiQRCodeData({this.ssid, this.password, this.encryption});

  String? ssid;
  String? password;
  String? encryption;
}
