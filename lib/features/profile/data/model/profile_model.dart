import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

//this model used with show prfile "GET" request and
//the response of update profile "POST" request

@JsonSerializable()
class Profile {
  Data? data;
  String? message;
  List? error;
  int? status;

  Profile({this.message, this.data, this.status, this.error});
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  @JsonKey(name: "email_verified")
  bool? emailVerified;
  String? image;

  Data(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.city,
      this.phone,
      this.emailVerified,
      this.image});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// {
//     "data": {
//         "id": 3,
//         "name": "user",
//         "email": "user@user.com",
//         "address": null,
//         "city": null,
//         "phone": null,
//         "email_verified": true,
//         "image": "http://127.0.0.1:8000/storage"
//     },
//     "message": "",
//     "error": [],
//     "status": 200
// }
