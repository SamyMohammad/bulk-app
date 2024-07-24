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
      if (response.status == 200) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
            ApiErrorModel(status: response.status, error: response.error));
      }

      // return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorModel());
    }
  }
}
