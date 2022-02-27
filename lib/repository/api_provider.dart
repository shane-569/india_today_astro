// ignore_for_file: avoid_print, prefer_final_fields, unnecessary_this, prefer_typing_uninitialized_variables, use_rethrow_when_possible

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:india_today_astro/repository/api_constants.dart';
import 'package:india_today_astro/repository/logging_interceptor.dart';

class ApiProvider {
  Dio? dio;
  ApiProvider() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 10000, connectTimeout: 5000);
    dio = Dio(options);
    dio!.interceptors.add(LoggingInterceptor(this.dio));
  }

  var _baseUrl = ApiConstants.baseURLs;

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');

    var responseJson;
    try {
      final response = await dio!.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      // AppToast.show("No Internet Available", AppColors.red);
      throw Exception('No Internet connection');
    } catch (e) {
      throw e;
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    print('Api Post, url $url');
    print('body $body');
    var responseJson;

    try {
      final response = await dio!
          .post(_baseUrl + url, data: body, options: Options(headers: headers));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      // AppToast.show("No Internet Available", AppColors.red);
      throw Exception('No Internet connection');
    } catch (e) {
      throw e;
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await dio!.put(_baseUrl + url, data: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw Exception('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await dio!.delete(_baseUrl + url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');

      throw Exception('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw Exception(response.toString());
      case 401:
        throw Exception(response.toString());
      case 403:
        throw Exception(response..toString());
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
