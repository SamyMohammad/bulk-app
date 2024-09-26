import 'package:bulk_app/core/networking/api_constants.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/shared/data/models/add_account_request_body.dart';
import 'package:bulk_app/features/shared/data/models/get_account_by_id_rm/get_account_by_id_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_all_accounts_rm/account_r_m.dart';
import 'package:bulk_app/features/shared/data/models/get_all_accounts_rm/get_all_accounts_rm.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'shared_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SharedApiServices {
  factory SharedApiServices(Dio dio, {String baseUrl}) = _SharedApiServices;

  @GET(ApiConstants.account)
  Future<BaseResponse<GetAllAccountsRm>> getAllAccounts();

  @POST(ApiConstants.account)
  Future<BaseResponse<AccountRM>> addAccount(
    @Body()  AddAccountRequestBody addAccountRequestBody);

  @DELETE("${ApiConstants.account}/{id}")
  Future<BaseResponse<AccountRM>> deleteAccount(@Path('id') String id);

  @GET("${ApiConstants.account}/{id}")
  Future<GetAccountByIdRm> getAccountById(@Path('id') String id);

  @GET("subscribe/${ApiConstants.account}/{token}")
  Future<dynamic> subscribeAccount(
    @Path('token') String token,
  );

  // @GET("${ApiConstants.campaign}/active/{token}")
  // Future<dynamic> getActiveAccount(
  //   @Path('token') String token,
  // );

  // @POST(ApiConstants.template)
  // Future<BaseResponse> addTemplate(
  //   @Body() AddTemplateRequestBody addTemplateRequestBody,
  // );

  // @GET(ApiConstants.template)
  // Future<BaseResponse<TemplatesData>> getAllTemplates();

  // @DELETE("${ApiConstants.template}/{id}")
  // Future<BaseResponse> deleteTemplate(@Path('id') String id);

  // @GET("${ApiConstants.template}/{id}")
  // Future<BaseResponse<GetTemplateByIdResponse>> getTemplate(
  //     @Path('id') String id);

  // @PUT("${ApiConstants.template}/{id}")
  // Future<BaseResponse> updateTemplate(
  //   @Path('id') String id,
  //   @Body() UpdateTemplateRequestBody updateTemplateRequestBody,
  // );
  // @GET(ApiConstants.audience)
  // Future<BaseResponse<AudiencesListData>> getAllAudience();

  // @GET("${ApiConstants.audience}/{id}")
  // Future<BaseResponse<AudienceData>> getAudienceById(@Path("id") String id);

  // @DELETE("${ApiConstants.audience}/{id}")
  // Future<BaseResponse<AudienceData>> deleteAudience(@Path("id") String id);

  // @PUT("${ApiConstants.audience}/{id}")
  // Future<BaseResponse<AudienceData>> updateAudience(
  //     @Path("id") num id, @Body() Audience audience);

  // @POST(ApiConstants.audience)
  // Future<BaseResponse<AudienceData>> addNewAudience(@Body() Audience audience);
}
