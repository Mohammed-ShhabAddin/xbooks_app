import 'package:json_annotation/json_annotation.dart';

part 'sliders_model.g.dart';

@JsonSerializable()
class SliderModel {
  Data? data;
  String? message;
  int? status;
  List? error;

  SliderModel({this.message, this.data, this.status, this.error});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}

@JsonSerializable()
class Data {
  List<Slider>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Slider {
  String? image;

  Slider({this.image});

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);
}
// {
//     "data": {
//         "sliders": [
//             {
//                 "image": "http://127.0.0.1:8000/front/assets/images/carousel-3.png"
//             },
//             {
//                 "image": "http://127.0.0.1:8000/front/assets/images/carousel-2.png"
//             },
//             {
//                 "image": "http://127.0.0.1:8000/front/assets/images/carousel-1.png"
//             }
//         ]
//     },
//     "message": "",
//     "error": [],
//     "status": 200
//  }