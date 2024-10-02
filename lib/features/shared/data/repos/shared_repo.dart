import 'package:bulk_app/core/networking/api_error_handler.dart';
import 'package:bulk_app/core/networking/api_result.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/shared/data/models/add_account_request_body.dart';
import 'package:bulk_app/features/shared/data/models/get_account_by_id_rm/get_account_by_id_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_all_accounts_rm/account_r_m.dart';
import 'package:bulk_app/features/shared/data/models/get_all_accounts_rm/get_all_accounts_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_campain_rm/get_campain_rm.dart';

class SharedRepo {
  final ApiService _apiService;
  SharedRepo(this._apiService);

  Future<ApiResult<BaseResponse<GetAllAccountsRm>>> getAllAccounts() async {
    try {
      final response = await _apiService.getAllAccounts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetAccountByIdRm>> getAccountById(String id) async {
    try {
      final response = await _apiService.getAccountById(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<GetCampainRm>> getActiveCampain(String token) async {
    try {
      final response = await _apiService.getActiveCampaign(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<BaseResponse<AccountRM>>> addAccount(
      AddAccountRequestBody addAccountRequestBody) async {
    try {
      final response = await _apiService.addAccount(addAccountRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
