// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? token;
  @JsonKey(name: 'user')
  UserData? userData;

  SignUpResponse({this.userData, this.token});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? id;
  String? email;

  String? name;
  String? gender;
  String? goal;
  @JsonKey(name: 'avatarUrl')
  String? photo;

  String? dateOfBirth;
  double? weight;
  double? height;

  UserData({
    this.id,
    this.email,
    this.name,
    this.gender,
    this.goal,
    this.photo,
    this.dateOfBirth,
    this.weight,
    this.height,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
