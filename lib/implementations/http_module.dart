import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app/constants/data_constants.dart';
import 'package:app/enum/enums.dart';
import 'package:app/interceptors/api_interceptor.dart';
import 'package:app/models/dummy/api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const _200 = 200;
const _300 = 300;
const _400 = 400;
const _500 = 500;

class HttpModule implements ApiInterceptor {
  static String bearerToken = 'null';

  static setToken({required String token}) => bearerToken = 'Bearer $token';

  @override
  Future<ApiResponse> getRequest({required String endPoint, required Header header}) async {
    HttpClient client = HttpClient();
    try {
      var uri = Uri.parse(endPoint);
      http.Response response = await http.get(uri, headers: _getHeader(header));
      return returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endPoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> postRequest({required String endPoint, required Header header, body}) async {
    HttpClient client = HttpClient();
    try {
      var uri = Uri.parse(endPoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.post(uri, body: encodedBody, headers: _getHeader(header));
      return returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endPoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> putRequest({required String endPoint, required Header header, body}) async {
    HttpClient client = HttpClient();
    try {
      var uri = Uri.parse(endPoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.put(uri, body: encodedBody, headers: _getAuthHeaders());
      return returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endPoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  @override
  Future<ApiResponse> deleteRequest({required String endPoint, required Header header, body}) async {
    HttpClient client = HttpClient();
    try {
      var uri = Uri.parse(endPoint);
      var encodedBody = body == null ? null : json.encode(body);
      http.Response response = await http.delete(uri, body: encodedBody, headers: _getAuthHeaders());
      return returnResponse(response);
    } catch (error) {
      if (kDebugMode) print('ERROR::::::$error::::::$endPoint');
      client.close();
      return ApiResponse(status: _500, response: null);
    }
  }

  ApiResponse returnResponse(http.Response response) {
    int statusCode = response.statusCode;
    if (kDebugMode) print('status-code: $statusCode ::: endpoint: ${response.request?.url}');
    if (statusCode >= 500 && statusCode <= 599) return ApiResponse(status: _500, response: null);
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if ((statusCode >= 200 && statusCode <= 299) || statusCode == 422) {
      return ApiResponse(status: _200, response: jsonResponse);
    } else if (statusCode == 401 || statusCode == 403) {
      log('b');
      return ApiResponse(status: _400, response: jsonResponse);
    } else if (statusCode == 404) {
      return ApiResponse(status: _300, response: jsonResponse);
    } else if (statusCode == 422) {
      return ApiResponse(status: _300, response: jsonResponse);
    } else {
      return ApiResponse(status: _500, response: null);
    }
  }

  Map<String, String> _getHeader(Header header) => header == Header.http ? _getHttpHeaders() : _getAuthHeaders();

  Map<String, String> _getHttpHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = 'application/json';
    return headers;
  }

  Map<String, String> _getAuthHeaders() {
    Map<String, String> headers = <String, String>{};
    headers['X-MASTER-KEY'] = MASTER_KEY;
    headers['Content-Type'] = 'application/json';
    return headers;
  }
}
