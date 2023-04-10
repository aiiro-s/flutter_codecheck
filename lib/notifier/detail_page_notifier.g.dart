// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_page_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$detailPageNotifierHash() =>
    r'4244989078f324696182a408d6cde870212a193a';

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

abstract class _$DetailPageNotifier
    extends BuildlessAutoDisposeNotifier<DetailPageState> {
  late final RepositoryItem item;

  DetailPageState build(
    RepositoryItem item,
  );
}

/// See also [DetailPageNotifier].
@ProviderFor(DetailPageNotifier)
const detailPageNotifierProvider = DetailPageNotifierFamily();

/// See also [DetailPageNotifier].
class DetailPageNotifierFamily extends Family<DetailPageState> {
  /// See also [DetailPageNotifier].
  const DetailPageNotifierFamily();

  /// See also [DetailPageNotifier].
  DetailPageNotifierProvider call(
    RepositoryItem item,
  ) {
    return DetailPageNotifierProvider(
      item,
    );
  }

  @override
  DetailPageNotifierProvider getProviderOverride(
    covariant DetailPageNotifierProvider provider,
  ) {
    return call(
      provider.item,
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
  String? get name => r'detailPageNotifierProvider';
}

/// See also [DetailPageNotifier].
class DetailPageNotifierProvider extends AutoDisposeNotifierProviderImpl<
    DetailPageNotifier, DetailPageState> {
  /// See also [DetailPageNotifier].
  DetailPageNotifierProvider(
    this.item,
  ) : super.internal(
          () => DetailPageNotifier()..item = item,
          from: detailPageNotifierProvider,
          name: r'detailPageNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$detailPageNotifierHash,
          dependencies: DetailPageNotifierFamily._dependencies,
          allTransitiveDependencies:
              DetailPageNotifierFamily._allTransitiveDependencies,
        );

  final RepositoryItem item;

  @override
  bool operator ==(Object other) {
    return other is DetailPageNotifierProvider && other.item == item;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, item.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  DetailPageState runNotifierBuild(
    covariant DetailPageNotifier notifier,
  ) {
    return notifier.build(
      item,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
