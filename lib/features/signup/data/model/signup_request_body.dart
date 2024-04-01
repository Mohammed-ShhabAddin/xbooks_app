import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignupRequestBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
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