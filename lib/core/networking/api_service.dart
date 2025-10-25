import 'package:dio/dio.dart';
import 'package:fitnestx/core/networking/api_constants.dart';
import 'package:fitnestx/features/login/data/models/login_request_body.dart';
import 'package:fitnestx/features/login/data/models/login_response.dart';
import 'package:fitnestx/features/signup/data/models/sign_up_request_body.dart';
import 'package:fitnestx/features/signup/data/models/sign_up_response.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignUpResponse> signup(@Body() SignUpRequestBody signUpRequestBody);
}
