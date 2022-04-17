import 'base_exception.dart';

class ApiException implements BaseException {
  final int? statusCode;
  final String message;

  const ApiException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() {
    return message;
  }
}
