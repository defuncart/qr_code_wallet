import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_wallet/core/db/models/qr_code.dart';
import 'package:qr_code_wallet/core/db/repositories/qr_db_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';

@Riverpod(keepAlive: true)
QRDBRepository codesDb(Ref ref) => QRDBRepository();

@riverpod
Stream<List<QRCode>> watchCodes(Ref ref) => ref.read(codesDbProvider).watch();

@riverpod
QRCode? getQRCode(Ref ref, {required int id}) => ref.read(codesDbProvider).get(id);
