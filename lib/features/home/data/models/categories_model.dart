import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class Categories {
  Data? data;
  String? message;
  List? error;
  int? status;

  Categories({this.message, this.data, this.status, this.error});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

@JsonSerializable()
class Data {
  List<Category>? categories;
  Meta? meta;
  Links? links;

  Data({this.categories, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Category {
  int? id;
  String? name;
  @JsonKey(name: 'products_count')
  int? productsCount;

  Category({this.id, this.name, this.productsCount});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class Meta {
  int? total;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'last_page')
  int? lastPage;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@JsonSerializable()
class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}


// {
//     "data": {
//         "categories": [
//             {
//                 "id": 2,
//                 "name": "Software",
//                 "products_count": 29
//             },
//             {
//                 "id": 3,
//                 "name": "DevOps",
//                 "products_count": 10
//             },
//             {
//                 "id": 4,
//                 "name": "AI & Data Science",
//                 "products_count": 10
//             }
//         ],
//         "meta": {
//             "total": 3,
//             "per_page": 15,
//             "current_page": 1,
//             "last_page": 1
//         },
//         "links": {
//             "first": "https://codingarabic.online/api/categories?page=1",
//             "last": "https://codingarabic.online/api/categories?page=1",
//             "prev": null,
//             "next": null
//         }
//     },
//     "message": "",
//     "error": [],
//     "status": 200
// }