import 'package:dio/dio.dart';

String dioErrorProcessor(DioException error) {
  if (error.response == null) {
    return 'An unexpected error occurred';
  }

  if (error.response?.data['error'] == null) {
    return 'An unexpected error occurred';
  }

  if (error.response!.data['error']['message'].runtimeType == String) {
    return error.response!.data['error']['message'].toString();
  }
  if (error.response!.data['error']['message'].runtimeType == List<dynamic>) {
    var errorBuffer = StringBuffer();

    error.response!.data['message']
        .take(3)
        .forEach((value) => errorBuffer.writeln(value.toString()));
    return errorBuffer.toString();
  }

  return 'An unexpected error occurred';
}
