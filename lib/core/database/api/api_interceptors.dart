import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['token'] = sl<CacheHelper>().getData(key: 'token') != null
    //     ? 'FOODAPI ${sl<CacheHelper>().getData(key: 'token')}'
    //     : null;
    super.onRequest(options, handler);
  }
}
