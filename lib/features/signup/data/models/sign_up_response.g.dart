// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.userData};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  name: json['name'] as String?,
  gender: json['gender'] as String?,
  goal: json['goal'] as String?,
  photo: json['avatarUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'gender': instance.gender,
  'goal': instance.goal,
  'avatarUrl': instance.photo,
  'dateOfBirth': instance.dateOfBirth,
  'weight': instance.weight,
  'height': instance.height,
};
