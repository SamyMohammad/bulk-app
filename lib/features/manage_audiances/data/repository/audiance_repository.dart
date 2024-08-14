import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class AudienceRepository {
  final ApiService _apiService;

  AudienceRepository(this._apiService);

  Future<ApiResult<BaseResponse<AudienceResponseData>>> getAllAudiences() async {
    try {
      final response = await _apiService.getAllAudience();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
