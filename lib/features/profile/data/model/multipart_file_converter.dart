import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'multipart_file_converter.g.dart';

@JsonSerializable()
class MultipartFileConverter implements JsonConverter<MultipartFile, String> {
  const MultipartFileConverter();

  @override
  MultipartFile fromJson(String json) {
    final filePath = json;
    return MultipartFile.fromFileSync(filePath);
  }

  @override
  String toJson(MultipartFile object) {
    return object.filename!;
  }
}
