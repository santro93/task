import 'package:dio/dio.dart';
import 'package:task/src/network/dio_retry_interceptor/retry_interceptor.dart';

class DioFactory {
  static final DioFactory _singleton = DioFactory._internal();
  Dio? dio;
  factory DioFactory() {
    return _singleton;
  }

  DioFactory._internal() {
    dio = Dio();
    dio!.interceptors.add(
      RetryInterceptor(
        dio: dio!,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 10), // wait 10 sec before first retry
          Duration(seconds: 10), // wait 10 sec before second retry
          Duration(seconds: 10), // wait 10 sec before third retry
        ],
      ),
    );
  }

  Dio getDio() => dio!;
}
