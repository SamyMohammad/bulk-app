import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/features/start_campains/data/model/create_campaign_rm/create_campaign_rm.dart';
import 'package:bulk_app/features/start_campains/data/model/create_campain_request_model.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../model/toggle_campaign_rm/toggle_campaign_rm.dart';

class StartCampainRepo {
  final ApiService _apiService;

  StartCampainRepo(this._apiService);

  Future<ApiResult<CreateCampaignRm>> createCampaign(
      CreateCampainRequestBody createCampaignRequestBody) async {
    try {
      final response =
          await _apiService.createCampaign(createCampaignRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ToggleCampaignRm>> toggleCampaign(int id) async {
    try {
      final response = await _apiService.toggleCampaign(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
