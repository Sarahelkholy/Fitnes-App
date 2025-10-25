// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? token;
  @JsonKey(name: 'user')
  UserData? userData;
  LoginResponse({this.token, this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
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

  UserData({
    this.id,
    this.email,
    this.name,
    this.gender,
    this.goal,
    this.photo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
