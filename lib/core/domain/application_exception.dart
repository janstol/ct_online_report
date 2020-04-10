abstract class ApplicationException implements Exception {
  final String message = '';

  @override
  String toString() => 'ApplicationException($message)';
}
