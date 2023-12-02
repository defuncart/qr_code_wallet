// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$codesDbHash() => r'bee77b8111b57a972b94d445af70b9e68259baad';

/// See also [codesDb].
@ProviderFor(codesDb)
final codesDbProvider = Provider<QRDBRepository>.internal(
  codesDb,
  name: r'codesDbProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$codesDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CodesDbRef = ProviderRef<QRDBRepository>;
String _$watchCodesHash() => r'473ad44f59335b1182eb6aab3e2d136528541948';

/// See also [watchCodes].
@ProviderFor(watchCodes)
final watchCodesProvider = AutoDisposeStreamProvider<List<QRCode>>.internal(
  watchCodes,
  name: r'watchCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$watchCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCodesRef = AutoDisposeStreamProviderRef<List<QRCode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
