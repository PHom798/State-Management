// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(jokeService)
final jokeServiceProvider = JokeServiceProvider._();

final class JokeServiceProvider
    extends $FunctionalProvider<JokeService, JokeService, JokeService>
    with $Provider<JokeService> {
  JokeServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeServiceHash();

  @$internal
  @override
  $ProviderElement<JokeService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JokeService create(Ref ref) {
    return jokeService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JokeService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JokeService>(value),
    );
  }
}

String _$jokeServiceHash() => r'700968ca6e88b2e867a67c0dd3ec4076cb9a8b89';

@ProviderFor(randomJoke)
final randomJokeProvider = RandomJokeProvider._();

final class RandomJokeProvider
    extends $FunctionalProvider<AsyncValue<Joke>, Joke, FutureOr<Joke>>
    with $FutureModifier<Joke>, $FutureProvider<Joke> {
  RandomJokeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomJokeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomJokeHash();

  @$internal
  @override
  $FutureProviderElement<Joke> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Joke> create(Ref ref) {
    return randomJoke(ref);
  }
}

String _$randomJokeHash() => r'be8a889a270e4399fa514a769b2f2ba593e9b377';
