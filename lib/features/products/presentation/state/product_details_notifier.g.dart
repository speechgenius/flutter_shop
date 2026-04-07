// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailsNotifierHash() =>
    r'5278e7922382b1a9662e568419d7ef0954cac147';

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

abstract class _$ProductDetailsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final String id;

  FutureOr<Product> build(String id);
}

/// See also [ProductDetailsNotifier].
@ProviderFor(ProductDetailsNotifier)
const productDetailsNotifierProvider = ProductDetailsNotifierFamily();

/// See also [ProductDetailsNotifier].
class ProductDetailsNotifierFamily extends Family<AsyncValue<Product>> {
  /// See also [ProductDetailsNotifier].
  const ProductDetailsNotifierFamily();

  /// See also [ProductDetailsNotifier].
  ProductDetailsNotifierProvider call(String id) {
    return ProductDetailsNotifierProvider(id);
  }

  @override
  ProductDetailsNotifierProvider getProviderOverride(
    covariant ProductDetailsNotifierProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailsNotifierProvider';
}

/// See also [ProductDetailsNotifier].
class ProductDetailsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ProductDetailsNotifier, Product> {
  /// See also [ProductDetailsNotifier].
  ProductDetailsNotifierProvider(String id)
    : this._internal(
        () => ProductDetailsNotifier()..id = id,
        from: productDetailsNotifierProvider,
        name: r'productDetailsNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$productDetailsNotifierHash,
        dependencies: ProductDetailsNotifierFamily._dependencies,
        allTransitiveDependencies:
            ProductDetailsNotifierFamily._allTransitiveDependencies,
        id: id,
      );

  ProductDetailsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Product> runNotifierBuild(
    covariant ProductDetailsNotifier notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(ProductDetailsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailsNotifierProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<ProductDetailsNotifier, Product>
  createElement() {
    return _ProductDetailsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsNotifierProvider && other.id == id;
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
mixin ProductDetailsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductDetailsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ProductDetailsNotifier, Product>
    with ProductDetailsNotifierRef {
  _ProductDetailsNotifierProviderElement(super.provider);

  @override
  String get id => (origin as ProductDetailsNotifierProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
