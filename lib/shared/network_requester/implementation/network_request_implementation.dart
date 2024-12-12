import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inewsfeed/shared/network_requester/inf_exception.dart';
import 'package:inewsfeed/shared/network_requester/method_type_enum.dart';
import 'package:inewsfeed/shared/network_requester/network_requester.dart';
import 'package:inewsfeed/shared/logger.dart';

class NetworkRequesterImpl implements NetworkRequester {
  final Dio _dio;
  NetworkRequesterImpl(this._dio);
  static const int statusCodeOk = 200;
  static const int statusCodeCreated = 201;
  static const int statusCodeNoContent = 204;

  @override
  Future<Map<String, dynamic>> request(
      String baseUrl, String path, MethodType methodType,
      [Map<String, dynamic>? headers, Map<String, dynamic>? data]) async {
    try {
      var response = await _dio.request(
        "$baseUrl$path",
        options: Options(
          method: methodType.value,
          headers: headers,
        ),
        data: data,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      return _handleDioException(e);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Map<String, dynamic> _processResponse(Response response) {
    if ([statusCodeOk, statusCodeCreated, statusCodeNoContent]
        .contains(response.statusCode)) {
      return response.data as Map<String, dynamic>;
    } else {
      throw InfException(
          msg:
              "something went wrong: ${response.data ?? ""}, ${response.statusMessage ?? ""}",
          statusCode: response.statusCode ?? 0);
    }
  }

  Future<Map<String, dynamic>> _handleDioException(
    DioException e,
  ) async {
    if (e.error is SocketException) {
      logger.e("Network error: $e");
      throw const SocketException("No internet");
    }
    final statusCode = e.response?.statusCode;
    throw InfException(
        msg:
            "something went wrong: ${e.response?.data ?? ""}, ${e.response?.statusMessage ?? ""}",
        statusCode: statusCode ?? 0);
  }
}
