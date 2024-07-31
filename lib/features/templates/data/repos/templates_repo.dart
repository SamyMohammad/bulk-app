import 'package:bulk_app/core/networking/api_error_model.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/templates/data/models/add_template_request_body.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class TemplatesRepo {
  final ApiService _apiService;

  TemplatesRepo(this._apiService);

  Future<ApiResult<BaseResponse>> addTemplate(
      AddTemplateRequestBody addTemplateRequestBody) async {
    try {
      final response = await _apiService.addTemplate(addTemplateRequestBody);
      if (response.status! >= 200 || response.status! < 300) {
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

  Future<ApiResult<BaseResponse<TemplatesData>>> getAllTemplates() async {
    try {
      final response = await _apiService.getAllTemplates();
      if (response.status! >= 200 || response.status! < 300) {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
            ApiErrorModel(status: response.status, error: response.error));
      }
    } catch  (errors) {
      debugPrint('$errors');
      return ApiResult.failure(ApiErrorModel(error: ErrorData(error: errors.toString())));
    }
  }
}
