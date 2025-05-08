import 'package:freezed_annotation/freezed_annotation.dart';
 part "local_result.freezed.dart";

@Freezed()
abstract class LocalResult<T> with _$LocalResult<T>{
  const factory LocalResult.success(T data)=Success<T>;
  const factory LocalResult.failure(String message)=Failure<T>;
}
