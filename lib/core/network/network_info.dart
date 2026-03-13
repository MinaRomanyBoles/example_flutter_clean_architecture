import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}


/*

import 'dart:io';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // لم نعد بحاجة لحقن أي كلاس خارجي في الـ Constructor
  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    try {
      // نحاول البحث عن عنوان جوجل
      final result = await InternetAddress.lookup('google.com');

      // إذا نجح الاتصال ورجع ببيانات، إذن يوجد إنترنت
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      // إذا حدث خطأ في الاتصال (SocketException)، إذن لا يوجد إنترنت
      return false;
    }
    return false;
  }
}

 */