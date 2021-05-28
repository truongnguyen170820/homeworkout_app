import 'package:json_annotation/json_annotation.dart';

part 'login_social_request.g.dart';

@JsonSerializable()
class LoginSocialRequest {
  @JsonKey(name: "FacebookId")
  String facebookId;
  @JsonKey(name: "GoogleId")
  String googleId;
  @JsonKey(name: "AppleId")
  String appleId;
  @JsonKey(name: "Type")
  int type;
  @JsonKey(name: "Email")
  String email;
  @JsonKey(name: "Language")
  String language;
  @JsonKey(name: "UserName")
  String userName;
  @JsonKey(name: "Name")
  String name;





  LoginSocialRequest(
      this.facebookId, this.googleId, this.type, this.email, this.language,this.name,this.appleId,this.userName);

  factory LoginSocialRequest.fromJson(Map<String, dynamic> json) => _$LoginSocialRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginSocialRequestToJson(this);
}