import 'package:flutter_nb_net/flutter_net.dart';

/// 默认解码器
class MyHttpDecoder extends NetDecoder {
  /// 单例对象
  static final MyHttpDecoder _instance = MyHttpDecoder._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  MyHttpDecoder._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory MyHttpDecoder.getInstance() => _instance;

  @override
  K decode<T, K>({required Response<dynamic> response, required T decodeType}) {
    var errorCode = response.data['errorCode'];

    /// 请求成功
    if (errorCode == 0) {
      var data = response.data['data'];
      if (decodeType is BaseNetModel) {
        if (data is List) {
          var dataList = List<T>.from(
              data.map((item) => decodeType.fromJson(item)).toList()) as K;
          return dataList;
        } else {
          var model = decodeType.fromJson(data) as K;
          return model;
        }
      } else {
        return data as K;
      }
    } else {
      var errorMsg = response.data['errorMsg'];
      throw NetException(errorMsg, errorCode);
    }
  }
}
