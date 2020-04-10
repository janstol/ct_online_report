import 'package:ctonlinereport/core/domain/application_exception.dart';

/// Exception for API.
class ApiException implements ApplicationException {
  /// Message.
  @override
  final String message;

  /// HTTP status code.
  final int statusCode;

  /// Creates ApiException.
  ApiException(this.message, [this.statusCode]);

  @override
  String toString() {
    return 'ApiException($message, $statusCode)';
  }
}
