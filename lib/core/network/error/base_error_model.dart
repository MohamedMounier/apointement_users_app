abstract class BaseErrorModel {
  final String message;
  final int? code;

  const BaseErrorModel({required this.message, required this.code});
}
