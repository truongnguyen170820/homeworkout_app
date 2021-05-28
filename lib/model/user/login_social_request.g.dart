// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_social_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSocialRequest _$LoginSocialRequestFromJson(Map<String, dynamic> json) {
  return LoginSocialRequest(
    json['FacebookId'] as String,
    json['GoogleId'] as String,
    json['Type'] as int,
    json['Email'] as String,
    json['Language'] as String,
    json['Name'] as String,
    json['AppleId'] as String,
    json['UserName'] as String,
  );
}

Map<String, dynamic> _$LoginSocialRequestToJson(LoginSocialRequest instance) =>
    <String, dynamic>{
      'FacebookId': instance.facebookId,
      'GoogleId': instance.googleId,
      'AppleId': instance.appleId,
      'Type': instance.type,
      'Email': instance.email,
      'Language': instance.language,
      'UserName': instance.userName,
      'Name': instance.name
    };
