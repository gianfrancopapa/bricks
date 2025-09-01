// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequest _$EmailVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$EmailVerificationRequestToJson(
        EmailVerificationRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
