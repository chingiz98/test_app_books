import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  int id;

  SignUpResponse({
    this.id,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json['data'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
