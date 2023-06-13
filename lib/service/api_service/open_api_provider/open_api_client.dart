import 'package:food_app/service/api_service/open_api_provider/custom_exception.dart';
import '../../../utils/tools/file_importer.dart';


class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://run.mocky.io/v3/",
        connectTimeout: 25000,
        receiveTimeout: 20000));

    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
        case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
        case DioErrorType.response:
          switch (error.response?.statusCode) {
          }
      }
      debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) {
      requestOptions.headers["Accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }));
  }
}
