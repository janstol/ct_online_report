import 'package:flutter/foundation.dart';

/// Wrapper class for result.
/// Contains either [error] or [value] but not both.
///
/// Similar to Either type (left = Error, Right = value on success) but simpler.
@immutable
class Result<E, V> {
  /// Error value.
  final E error;

  /// Success value.
  final V value;

  /// Indicates whether this result is loading.
  final bool isLoading;

  const Result._(this.error, this.value, [this.isLoading = false]);

  /// Creates successful result with [value].
  factory Result.success(V value) => _Success(value);

  /// Creates error result with [error] value.
  factory Result.error(E error) => _Error(error);

  /// Creates a loading result.
  factory Result.loading() => const _Loading();

  /// Returns whether this result contains a non-null [error] value.
  bool get hasError => error != null;

  /// Returns whether this result contains a non-null [value].
  ///
  /// This can be false even when the result is successful,
  /// if provided [value] is a non-null value.
  bool get hasValue => value != null;

  /// Returns whether this result is loading.
  bool get loading => isLoading;

  @override
  int get hashCode => error.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Result && error == other.error && value == other.value;
  }

  @override
  String toString() => 'Result($error, $value, $loading)';
}

/// Successful result.
// ignore: prefer_void_to_null
class _Success<V> extends Result<Null, V> {
  final V val;

  const _Success(this.val) : super._(null, val);
}

/// Error result.
// ignore: prefer_void_to_null
class _Error<E> extends Result<E, Null> {
  final E e;

  const _Error(this.e) : super._(e, null);
}

/// Loading result.
class _Loading<Null> extends Result<Null, Null> {
  const _Loading() : super._(null, null, true);
}
