import 'package:dio/dio.dart';

class BaseResponse<T> {
  late int statusCode;
  T? data;

  BaseResponse(
    this.statusCode,
    this.data,
  );

  isSuccess() {
    return [200, 201, 204].contains(statusCode);
  }

  BaseResponse.fromJson(Response<dynamic> json) {
    statusCode = json.statusCode!;
    data = json.data;
  }
}
