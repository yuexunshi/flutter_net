import '../flutter_net.dart';

/// A function that takes a `Response` and returns a `Result<T>`.
typedef NetConverter<T> = Result<T> Function(Response response);


