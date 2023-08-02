import '../flutter_net.dart';

/// Response 解码器
/// 把 Response 转换成对应类型
abstract class NetDecoder {
  ///  解码
  ///  [response] Response
  ///  [responseType] 解码类型
  ///  [T] BaseNetworkModel的实现
  ///  [K] 返回类型
  K decode<T, K>({required Response<dynamic> response, required T decodeType});
}
