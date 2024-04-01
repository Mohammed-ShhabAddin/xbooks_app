import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  Data? data;
  String? message;
  int? status;
  List? error;

  LoginResponse({this.message, this.data, this.status, this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class Data {
  String? token;
  User? user;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  @JsonKey(name: 'email_verified')
  bool? emailVerified;
  String? image;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.city,
      this.phone,
      this.emailVerified,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
