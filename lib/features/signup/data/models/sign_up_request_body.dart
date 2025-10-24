import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String gender;
  final String goal;
  final String dateOfBirth;
  final double weight;
  final double height;
  final String email;
  final String password;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.goal,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
