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
String _$getQRCodeHash() => r'ee398cd3e37f8a32aeb2b83e344f893e1ff5aeaa';

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
class GetQRCodeFamily extends Family {
  /// See also [getQRCode].
  const GetQRCodeFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getQRCodeProvider';

  /// See also [getQRCode].
  GetQRCodeProvider call({
    required int id,
  }) {
    return GetQRCodeProvider(
      id: id,
    );
  }

  @visibleForOverriding
  @override
  GetQRCodeProvider getProviderOverride(
    covariant GetQRCodeProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(QRCode? Function(GetQRCodeRef ref) create) {
    return _$GetQRCodeFamilyOverride(this, create);
  }
}

class _$GetQRCodeFamilyOverride implements FamilyOverride {
  _$GetQRCodeFamilyOverride(this.overriddenFamily, this.create);

  final QRCode? Function(GetQRCodeRef ref) create;

  @override
  final GetQRCodeFamily overriddenFamily;

  @override
  GetQRCodeProvider getProviderOverride(
    covariant GetQRCodeProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [getQRCode].
class GetQRCodeProvider extends AutoDisposeProvider<QRCode?> {
  /// See also [getQRCode].
  GetQRCodeProvider({
    required int id,
  }) : this._internal(
          (ref) => getQRCode(
            ref as GetQRCodeRef,
            id: id,
          ),
          from: getQRCodeProvider,
          name: r'getQRCodeProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getQRCodeHash,
          dependencies: GetQRCodeFamily._dependencies,
          allTransitiveDependencies: GetQRCodeFamily._allTransitiveDependencies,
          id: id,
        );

  GetQRCodeProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    QRCode? Function(GetQRCodeRef ref) create,
  ) {
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
  ({
    int id,
  }) get argument {
    return (id: id,);
  }

  @override
  AutoDisposeProviderElement<QRCode?> createElement() {
    return _GetQRCodeProviderElement(this);
  }

  GetQRCodeProvider _copyWith(
    QRCode? Function(GetQRCodeRef ref) create,
  ) {
    return GetQRCodeProvider._internal(
      (ref) => create(ref as GetQRCodeRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      id: id,
    );
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
