import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/manage_audiances/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/models/audiences.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AudienceRepository {
  final ApiService _apiService;

  AudienceRepository(this._apiService);

  Future<ApiResult<BaseResponse<AudienceResponseData>>>
      getAllAudiences() async {
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

  // Future<void> updateAudience(int id) async {
  //   try {
  //     final response =
  //         await _apiService.updateAudience(id.toString());

  //     if (response.status == 'success') {
  //       debugPrint('Audience updated successfully: ${response.data}');
  //     } else {
  //       // Handle failure (e.g., show error message)
  //       debugPrint('Failed to update audience: ${response.error}');
  //     }
  //   } catch (error) {
  //     // Handle unexpected errors
  //     debugPrint('Error updating audience: $error');
  //   }
  // }
}
