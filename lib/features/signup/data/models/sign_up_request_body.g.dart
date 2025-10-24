// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      goal: json['goal'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );

Map<String, dynamic> _$SignUpRequestBodyToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'goal': instance.goal,
      'dateOfBirth': instance.dateOfBirth,
      'weight': instance.weight,
      'height': instance.height,
      'email': instance.email,
      'password': instance.password,
    };
