import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AudienceRepository {
  final ApiService _apiService;

  AudienceRepository(this._apiService);

  Future<ApiResult<BaseResponse<AudiencesListData>>> getAllAudiences() async {
    try {
      final response = await _apiService.getAllAudience();
      if (response.status! >= 200 || response.status! < 300) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
            ApiErrorModel(status: response.status, error: response.error));
      }
    } catch (errors) {
      debugPrint('$errors');
      return ApiResult.failure(
          ApiErrorModel(error: ErrorData(error: errors.toString())));
    }
  }

  Future<ApiResult> deleteAudienceByid(String id) async {
    try {
      final response = await _apiService.deleteAudience(id);
      if (response.status! >= 200 || response.status! < 300) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
            ApiErrorModel(status: response.status, error: response.error));
      }
    } catch (errors) {
      debugPrint('$errors');
      return ApiResult.failure(
          ApiErrorModel(error: ErrorData(error: errors.toString())));
    }
  }

  Future<ApiResult> updateAudience(Audience audience) async {
    try {
      final response = await _apiService.updateAudience(audience.id!, audience);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BaseResponse<AudienceData>>> getAudienceById(
      String id) async {
    try {
      final response = await _apiService.getAudienceById(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BaseResponse<AudienceData>>> addNewAudience(
      Audience audience) async {
    try {
      final response = await _apiService.addNewAudience(audience);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
