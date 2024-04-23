import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gellary/core/components/custom_components/custom_snack_bar.dart';
import 'package:gellary/core/utils/app_constants/app_constants.dart';
import 'package:gellary/core/utils/app_constants/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../utils/api_utils/api_endpoints.dart';

part '../utils/api_utils/api_error_handler.dart';

part '../utils/api_utils/api_error_response.dart';

part '../utils/api_utils/api_response.dart';

part 'logging_interceptor.dart';

class DioClient {
  final String _baseUrl;
  final LoggingInterceptor _loggingInterceptor;
  final SharedPreferences _sharedPreferences;

  final Dio _dio;
  String? _token;

  DioClient(
    this._baseUrl,
    this._dio, {
    required LoggingInterceptor loggingInterceptor,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _loggingInterceptor = loggingInterceptor {
    _token = _sharedPreferences.getString(AppConstants.currentUserToken);
    if (kDebugMode) {
      print("NNNN $_token");
    }
    _dio
      ..options.baseUrl = _baseUrl
      ..options.connectTimeout = AppConstants.connectionTimeOut
      ..options.receiveTimeout = AppConstants.connectionTimeOut
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json',
      };
    _dio.interceptors.add(_loggingInterceptor);
  }

  Future<Response> get(
    String uri,
    StackTrace stackTrace, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  void updateToken() {
    _token = _sharedPreferences.getString(AppConstants.currentUserToken);
    _updateHeader();
  }

  void _updateHeader() {
    _dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $_token',
      'Accept': 'application/json',
    };
  }

  Future<Response> post(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _getFilePath(stackTrace);

    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  void _getFilePath(StackTrace stackTrace) {
    String filePath = 'Unknown file';
    List<String> traceLines = stackTrace.toString().split('\n');

    // Find the first line that doesn't contain Dio package
    for (String line in traceLines) {
      if (!line.contains('package:dio')) {
        filePath = line.trim();
        break;
      }
    }

    if (kDebugMode) {
      print("Request initiated from =>: $filePath");
    }
  }
}
