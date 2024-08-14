import 'package:bulk_app/core/networking/api_constants.dart';
import 'package:bulk_app/core/networking/base_response.dart';
import 'package:bulk_app/features/auth/data/models/login_response.dart';
import 'package:bulk_app/features/auth/data/models/register_response.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiance_response_data.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audiences.dart';
import 'package:bulk_app/features/templates/data/models/add_template_request_body.dart';
import 'package:bulk_app/features/templates/data/models/get_all_templates_response.dart';
import 'package:bulk_app/features/templates/data/models/get_template_by_id_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

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
  Future<BaseResponse<AudienceResponseData>> getAllAudience();

  @DELETE("${ApiConstants.audience}/{id}")
  Future<BaseResponse<AudienceResponseData>> deleteAudience(
      @Path("id") String id);

  @PUT("${ApiConstants.audience}/{id}")
  Future<BaseResponse<AudienceResponseData>> updateAudience(
      @Path("id") String id, @Body() Audiences audience);
}
