import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/features/auth/data/models/login_request_body.dart';
import 'package:bulk_app/features/auth/data/models/login_response.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      // if (response.status == 200) {
        return ApiResult.success(response);
      // } else {
      //   return ApiResult.failure(
      //       ApiErrorHandler.handle(response));
      // }

      // return ApiResult.success(response);
    } catch (error) {
      
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
