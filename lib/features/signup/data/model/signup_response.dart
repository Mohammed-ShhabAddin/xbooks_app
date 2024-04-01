import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  Data? data;
  String? message;
  int? status;
  List? error;

  SignupResponse({this.message, this.data, this.status, this.error});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
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

/**{
    "data": {
        "user": {
            "id": 413,
            "name": "mohammed",
            "email": "hms@mo.mo",
            "address": null,
            "city": null,
            "phone": null,
            "email_verified": true,
            "image": "https://codingarabic.online/admin/assets/img/default/user.jpg"
        },
        "token": "4161|pgsbAACf7He2wutEiv5TUNWMCNzExD2X56VN5vRP"
    },
    "message": "Successfully registered! Please verify your email.",
    "error": [],
    "status": 201
} */