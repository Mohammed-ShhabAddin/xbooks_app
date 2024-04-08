import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xbooks_store/features/profile/data/model/multipart_file_converter.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable(
  explicitToJson: true,
  converters: [MultipartFileConverter()],
)
class UpdateProfileRequestBody {
  @JsonKey(name: 'files')
  final List<MultipartFile> files;
  final String name;
  final String address;
  final String city;
  final String phone;

  UpdateProfileRequestBody(
      {required this.files,
      required this.name,
      required this.address,
      required this.city,
      required this.phone});

  factory UpdateProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);

  List<String?> get filePaths => files.map((file) => file.filename).toList();
}
