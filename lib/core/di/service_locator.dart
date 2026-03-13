import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  headers: {
    'Content-Type': 'application/json',
  },
);

// sl.registerLazySingleton(() => Dio(options));