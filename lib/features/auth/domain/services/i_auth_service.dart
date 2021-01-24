import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/features/auth/infrastructure/models/requests/sign_in_request.dart';
import 'package:testapp/features/auth/infrastructure/models/requests/sign_up_request.dart';
import 'package:testapp/features/auth/infrastructure/models/responses/get_info_response.dart';
import 'package:testapp/features/auth/infrastructure/models/responses/sign_in_response.dart';
import 'package:testapp/features/auth/infrastructure/models/responses/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'i_auth_service.g.dart';

@RestApi()
@lazySingleton
abstract class IAuthService {
  @factoryMethod
  factory IAuthService(Dio dio) = _IAuthService;

  @POST('/api/register')
  Future<SignUpResponse> signUp({
    @required @Body() SignUpRequest request,
  });

  @POST('/api/login')
  Future<SignInResponse> signIn({
    @required @Body() SignInRequest request,
  });

  @GET('/api/me')
  Future<GetInfoResponse> getUserInfo();

  @POST('/api/logout')
  Future<void> logout();
}
