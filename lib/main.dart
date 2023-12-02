import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:qr_code_wallet/core/widgets/my_app.dart';

Future<void> main() async {
  await Isar.initialize();
  runApp(const ProviderScope(child: MyApp()));
}
