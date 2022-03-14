class UnKnownApiException implements Exception {
  int httpCode;

  UnKnownApiException(this.httpCode);
}

class ItemNotFoundException implements Exception {}

class NetworkException implements Exception {}
