import 'package:json_annotation/json_annotation.dart';

part 'get_info_response.g.dart';

@JsonSerializable()
class GetInfoResponse {
  int id;
  String name;
  String email;

  GetInfoResponse({
    this.id,
    this.name,
    this.email,
  });

  factory GetInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInfoResponseFromJson(json['data'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$GetInfoResponseToJson(this);
}
