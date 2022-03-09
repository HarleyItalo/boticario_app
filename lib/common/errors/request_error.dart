class RequestError implements Exception {
  RequestError(this.message);
  final String message;
}
