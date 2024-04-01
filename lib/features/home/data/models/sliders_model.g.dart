// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      error: json['error'] as List<dynamic>?,
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'sliders': instance.sliders,
    };

Slider _$SliderFromJson(Map<String, dynamic> json) => Slider(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'image': instance.image,
    };
