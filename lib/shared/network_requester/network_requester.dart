import 'package:dio/dio.dart';
import 'package:inewsfeed/shared/network_requester/implementation/network_request_implementation.dart';
import 'package:inewsfeed/shared/network_requester/method_type_enum.dart';

abstract class NetworkRequester {
  static NetworkRequester? _instance;
  factory NetworkRequester() {
    return _instance ??= NetworkRequesterImpl(Dio());
  }
  Future<Map<String, dynamic>> request(
    String baseUrl,
    String path,
    MethodType methodType, [
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  ]);
}
