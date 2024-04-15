// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestBody(
      files: (json['files'] as List<dynamic>)
          .map((e) => const MultipartFileConverter().fromJson(e as String))
          .toList(),
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
        UpdateProfileRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'files':
          instance.files.map(const MultipartFileConverter().toJson).toList(),
      'address': instance.address,
      'city': instance.city,
      'phone': instance.phone,
    };
