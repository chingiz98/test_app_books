import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  String token;

  SignInResponse({
    this.token,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json['data'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
