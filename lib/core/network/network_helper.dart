part of 'network.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() : _dio = _configureDio();

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    params ??= {};
    params['appid'] = Api.key;

    var response = await _dio.get(endPoint,
        queryParameters: params, options: await _configureOptions(withToken));
    return response;
  }

  Future<Options> _configureOptions(bool withToken) async {
    Options options = Options();
    if (withToken) {
      // handle if there is a token
    }
    return options;
  }
}
