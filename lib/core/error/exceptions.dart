class ServerException implements Exception {
  final String? message;

  ServerException([this.message]); // الـ [] تجعل البراميتر اختيارياً
}

class EmptyCacheException implements Exception {
  final String? message;

  EmptyCacheException([this.message]);
}

class OfflineException implements Exception {}