// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storeDetailHash() => r'dc567ba76483695dd732b33efa47a6286ae22868';

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

abstract class _$StoreDetail
    extends BuildlessAutoDisposeNotifier<List<StoreDetailModel>> {
  late final String childKey;

  List<StoreDetailModel> build({
    required String childKey,
  });
}

/// See also [StoreDetail].
@ProviderFor(StoreDetail)
const storeDetailProvider = StoreDetailFamily();

/// See also [StoreDetail].
class StoreDetailFamily extends Family<List<StoreDetailModel>> {
  /// See also [StoreDetail].
  const StoreDetailFamily();

  /// See also [StoreDetail].
  StoreDetailProvider call({
    required String childKey,
  }) {
    return StoreDetailProvider(
      childKey: childKey,
    );
  }

  @override
  StoreDetailProvider getProviderOverride(
    covariant StoreDetailProvider provider,
  ) {
    return call(
      childKey: provider.childKey,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'storeDetailProvider';
}

/// See also [StoreDetail].
class StoreDetailProvider extends AutoDisposeNotifierProviderImpl<StoreDetail,
    List<StoreDetailModel>> {
  /// See also [StoreDetail].
  StoreDetailProvider({
    required this.childKey,
  }) : super.internal(
          () => StoreDetail()..childKey = childKey,
          from: storeDetailProvider,
          name: r'storeDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storeDetailHash,
          dependencies: StoreDetailFamily._dependencies,
          allTransitiveDependencies:
              StoreDetailFamily._allTransitiveDependencies,
        );

  final String childKey;

  @override
  bool operator ==(Object other) {
    return other is StoreDetailProvider && other.childKey == childKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, childKey.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  List<StoreDetailModel> runNotifierBuild(
    covariant StoreDetail notifier,
  ) {
    return notifier.build(
      childKey: childKey,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
