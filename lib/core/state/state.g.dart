// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$codesDbHash() => r'0d10f8a4ec61b9fce1d3ad11b235536e42716474';

/// See also [codesDb].
@ProviderFor(codesDb)
final codesDbProvider = Provider<QRDBRepository>.internal(
  codesDb,
  name: r'codesDbProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$codesDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CodesDbRef = ProviderRef<QRDBRepository>;
String _$watchCodesHash() => r'692d3fbef39c027e79235562ad53efc53854c754';

/// See also [watchCodes].
@ProviderFor(watchCodes)
final watchCodesProvider = AutoDisposeStreamProvider<List<QRCode>>.internal(
  watchCodes,
  name: r'watchCodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$watchCodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchCodesRef = AutoDisposeStreamProviderRef<List<QRCode>>;
String _$getQRCodeHash() => r'6d663503dc00ad42ca924c0fe55bd985e309570c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getQRCode].
@ProviderFor(getQRCode)
const getQRCodeProvider = GetQRCodeFamily();

/// See also [getQRCode].
class GetQRCodeFamily extends Family<QRCode?> {
  /// See also [getQRCode].
  const GetQRCodeFamily();

  /// See also [getQRCode].
  GetQRCodeProvider call({required int id}) {
    return GetQRCodeProvider(id: id);
  }

  @override
  GetQRCodeProvider getProviderOverride(covariant GetQRCodeProvider provider) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getQRCodeProvider';
}

/// See also [getQRCode].
class GetQRCodeProvider extends AutoDisposeProvider<QRCode?> {
  /// See also [getQRCode].
  GetQRCodeProvider({required int id})
    : this._internal(
        (ref) => getQRCode(ref as GetQRCodeRef, id: id),
        from: getQRCodeProvider,
        name: r'getQRCodeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getQRCodeHash,
        dependencies: GetQRCodeFamily._dependencies,
        allTransitiveDependencies: GetQRCodeFamily._allTransitiveDependencies,
        id: id,
      );

  GetQRCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(QRCode? Function(GetQRCodeRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: GetQRCodeProvider._internal(
        (ref) => create(ref as GetQRCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<QRCode?> createElement() {
    return _GetQRCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQRCodeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetQRCodeRef on AutoDisposeProviderRef<QRCode?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetQRCodeProviderElement extends AutoDisposeProviderElement<QRCode?> with GetQRCodeRef {
  _GetQRCodeProviderElement(super.provider);

  @override
  int get id => (origin as GetQRCodeProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
