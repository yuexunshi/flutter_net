/// A custom exception class.
class NetException implements Exception {
  final String? _message;

  String get message => _message ?? '请求出错';

  final int? _code;

  int get code => _code ?? -1;

  NetException([this._message, this._code]);

  @override
  String toString() {
    return "code:$code--message=$message";
  }
}
