/// Exception for API.
class ApiException implements Exception {
  /// Message.
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
