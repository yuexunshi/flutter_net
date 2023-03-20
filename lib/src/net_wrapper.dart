import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../flutter_net.dart';
import 'default_net_decoder.dart';

class NetWrapper {
  /// private constructor
  NetWrapper._() : _httpConfigBuilder = HttpConfigBuilder();

  /// the one and only instance of this singleton
  static final instance = NetWrapper._();

  final HttpConfigBuilder _httpConfigBuilder;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  NetDecoder _httpDecoder = DefaultNetDecoder.getInstance();

  NetDecoder get httpDecoder => _httpDecoder;
  bool _isLogger = true;

  /// Setting the base url for the http request.
  NetWrapper setBaseUrl(String baseUrl) {
    _httpConfigBuilder.setBaseUrl(baseUrl);
    return instance;
  }

  /// Setting the connection timeout for the http request.
  NetWrapper setConnectTimeout(Duration connectTimeout) {
    _httpConfigBuilder.setConnectTimeout(connectTimeout);
    return instance;
  }

  /// Adding headers to the request.
  NetWrapper addHeaders(Map<String, dynamic> headers) {
    _httpConfigBuilder.addHeaders(headers);
    return instance;
  }

  /// Setting the httpClientAdapter for the http request.
  ///  ex: proxy Certificate
  NetWrapper setHttpClientAdapter(HttpClientAdapter httpClientAdapter) {
    _httpConfigBuilder.setHttpClientAdapter(httpClientAdapter);
    return instance;
  }

  /// Adding an interceptor to the dio instance.
  NetWrapper addInterceptor(Interceptor interceptor) {
    _httpConfigBuilder.addInterceptor(interceptor);
    return instance;
  }

  /// Adding all the interceptors to the dio instance.
  NetWrapper addAllInterceptors(List<Interceptor> interceptors) {
    _httpConfigBuilder.addAllInterceptors(interceptors);
    return instance;
  }

  /// Setting the timeout for receiving data.
  NetWrapper setReceiveTimeout(Duration receiveTimeout) {
    _httpConfigBuilder.setReceiveTimeout(receiveTimeout);
    return instance;
  }

  /// Setting the timeout for sending data.
  NetWrapper setSendTimeout(Duration sendTimeout) {
    _httpConfigBuilder.setSendTimeout(sendTimeout);
    return instance;
  }

  /// Used to set the decoder for the response.
  NetWrapper setHttpDecoder(NetDecoder httpDecoder) {
    _httpDecoder = httpDecoder;
    return instance;
  }

  /// Used to enable/disable the logger.
  /// 默认使用 PrettyDioLogger 打印
  NetWrapper enableLogger(bool enable) {
    _isLogger = enable;
    return instance;
  }

  /// 配置网络请求并初始化
  void create() {
    var httpConfig = _httpConfigBuilder.create();
    if (httpConfig.interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(httpConfig.interceptors!);
    }
    if (_isLogger) {
      dio.interceptors.add(PrettyDioLogger());
    }
    _dio.options = BaseOptions(
        baseUrl: httpConfig.baseUrl ?? '',
        contentType: 'application/json',
        connectTimeout: httpConfig.connectTimeout,
        sendTimeout: httpConfig.sendTimeout,
        receiveTimeout: httpConfig.receiveTimeout,
        headers: httpConfig.headers);
    if (httpConfig.httpClientAdapter != null) {
      _dio.httpClientAdapter = httpConfig.httpClientAdapter!;
    }
  }
}
