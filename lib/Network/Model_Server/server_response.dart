

import 'server_error.dart';

class ServerResponse {
  final ServerError? error;
  final dynamic data;
  final String message;
  final bool status;

  ServerResponse(
      {required this.status, required this.message, this.error, this.data});

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
      error: json['error'] != null ?
          ServerError.fromJson(json['error']) : null);

  @override
  String toString() {
    return '{\n error: $error, data: $data, message: $message, status: $status}';
  }

  String logString(int statusCode , String url){
    String result= 'url is : ' + url + '\n';
    result += 'status code is : ' + statusCode.toString() + '\n';
    result += 'response body is : ' + toString();
    return result;
  }
}
