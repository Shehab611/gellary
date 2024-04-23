part of '../../usable_functions/api_service_helper.dart';

class ApiResponse {
  final Response? response;
  final int? statusCode;
  final dynamic error;

  ApiResponse(this.response, this.error, this.statusCode);

  ApiResponse.withError(dynamic errorValue, [int? statusC])
      : response = null,
        statusCode = statusC,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        statusCode = responseValue.statusCode,
        error = null;
}
