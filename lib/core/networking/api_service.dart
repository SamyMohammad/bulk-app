import 'package:bulk_app/core/networking/api_constants.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/auth/data/models/login_response.dart';
import 'package:bulk_app/features/auth/data/models/register_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/start_campains/data/model/create_campaign_rm/create_campaign_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_account_by_id_rm/get_account_by_id_rm.dart';
import 'package:bulk_app/features/shared/data/models/get_all_campaigns_rm/get_all_campaigns_rm.dart';
import 'package:bulk_app/features/start_campains/data/model/toggle_campaign_rm/toggle_campaign_rm.dart';
import 'package:bulk_app/features/templates/data/models/add_template_request_body.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:bulk_app/features/templates/data/models/get_template_by_id_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/login_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginAndRegisterRequestBody loginRequestBody,
  );
  @POST(ApiConstants.register)
  Future<BaseResponse<RegisterData>> register(
    @Body() LoginAndRegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.template)
  Future<BaseResponse> addTemplate(
    @Body() AddTemplateRequestBody addTemplateRequestBody,
  );

  @GET(ApiConstants.template)
  Future<BaseResponse<TemplatesData>> getAllTemplates();

  @DELETE("${ApiConstants.template}/{id}")
  Future<BaseResponse> deleteTemplate(@Path('id') String id);

  @GET("${ApiConstants.template}/{id}")
  Future<BaseResponse<GetTemplateByIdResponse>> getTemplate(
      @Path('id') String id);

  @PUT("${ApiConstants.template}/{id}")
  Future<BaseResponse> updateTemplate(
    @Path('id') String id,
    @Body() UpdateTemplateRequestBody updateTemplateRequestBody,
  );
  @GET(ApiConstants.audience)
  Future<BaseResponse<AudiencesListData>> getAllAudience();

  @GET("${ApiConstants.audience}/{id}")
  Future<BaseResponse<AudienceData>> getAudienceById(@Path("id") String id);

  @DELETE("${ApiConstants.audience}/{id}")
  Future<BaseResponse<AudienceData>> deleteAudience(@Path("id") String id);

  @PUT("${ApiConstants.audience}/{id}")
  Future<BaseResponse<AudienceData>> updateAudience(
      @Path("id") num id, @Body() Audience audience);

  @POST(ApiConstants.audience)
  Future<BaseResponse<AudienceData>> addNewAudience(@Body() Audience audience);

// Campaign

  @POST(ApiConstants.campaign)
  Future<CreateCampaignRm> createCampaign(
    int? templateId,
    int? audienceId,
    int? accountId,
  );

  @GET("${ApiConstants.campaign}/active/{token}")
  Future<BaseResponse> getActiveCampaign(@Path("token") int token);

  @GET("${ApiConstants.campaign}/{id}")
  Future<GetAccountByIdRm> getCampaignById(@Path("id") int id);

  @PATCH("${ApiConstants.campaign}/{id}")
  Future<ToggleCampaignRm> toggleCampaign(@Path("id") int id);

  @GET(ApiConstants.campaign)
  Future<GetAllCampaignsRm> getAllCampaigns();
}
