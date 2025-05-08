import 'package:appointment_users/core/network/error/base_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper.freezed.dart';

@freezed
class ResponseWrapper<T> with _$ResponseWrapper<T> {
  const factory ResponseWrapper.success(T data) = Success<T>;
  const factory ResponseWrapper.failure(BaseErrorModel error) = Failure<T>;
}
