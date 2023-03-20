import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
/// A wrapper class for the data that we want to return from the API.
abstract class Result<T> with _$Result<T>{
  const factory Result.success(T data) = Success;
  const factory Result.failure({@Default('') String msg,@Default(-1) int code}) = Failure;
}

