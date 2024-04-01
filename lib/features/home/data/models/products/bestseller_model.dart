import 'package:json_annotation/json_annotation.dart';

part 'bestseller_model.g.dart';

@JsonSerializable()
class BestSeller {
  Data? data;
  String? message;
  List? error;
  int? status;

  BestSeller({this.message, this.data, this.status, this.error});

  factory BestSeller.fromJson(Map<String, dynamic> json) =>
      _$BestSellerFromJson(json);
}

@JsonSerializable()
class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  @JsonKey(name: 'price_after_discount')
  double? priceAfterDiscount;
  int? stock;
  @JsonKey(name: 'best_seller')
  int? bestSeller;
  String? image;
  String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}


// {
//     "data": {
//         "products": [
//             {
//                 "id": 7,
//                 "name": "Clean Architecture",
//                 "description": "<p>By applying universal rules of software architecture, you can dramatically improve developer productivity throughout the life of any software system. Now, building upon the success of his best-selling books Clean Code and The Clean Coder, legendary software craftsman Robert C. Martin (“Uncle Bob”) reveals those rules and helps you apply them.</p>",
//                 "price": "289.00",
//                 "discount": 40,
//                 "price_after_discount": 173.4,
//                 "stock": 7,
//                 "best_seller": 93,
//                 "image": "https://codingarabic.online/storage/product/5Ifn8fCTBq1Uq13rbhp1MXu9spgu1GOrQlH1YKQ5.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 9,
//                 "name": "Algorithms Unplugged",
//                 "description": "<p>Algorithms specify the way computers process information and how they execute tasks. Many recent technological innovations and achievements rely on algorithmic ideas – they facilitate new applications in science, medicine, production, logistics, traffic, communi¬cation and entertainment. Efficient algorithms not only enable your personal computer to execute the newest generation of games with features unimaginable only a few years ago, they are also key to several recent scientific breakthroughs – for example, the sequencing of the human genome would not have been possible without the invention of new algorithmic ideas that speed up computations by several orders of magnitude.</p>",
//                 "price": "279.00",
//                 "discount": 30,
//                 "price_after_discount": 195.3,
//                 "stock": 53,
//                 "best_seller": 47,
//                 "image": "https://codingarabic.online/storage/product/lDk8FTWhZIPdM7Wz8TiHC8KFLuCDzJAqTk8WNRsF.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 49,
//                 "name": "Data Science from Scratch.2",
//                 "description": "<p>To really learn data science, you should not only master the tools—data science libraries, frameworks, modules, and toolkits—but also understand the ideas and principles underlying them. Updated for Python 3.6, this second edition of Data Science from Scratch shows you how these tools and algorithms work by implementing them from scratch.</p>",
//                 "price": "279.00",
//                 "discount": 50,
//                 "price_after_discount": 139.5,
//                 "stock": 76,
//                 "best_seller": 24,
//                 "image": "https://codingarabic.online/storage/product/5CUVpDxJU33HCGJhta9DHQnPtht5NJF7j1C7CyHk.jpg",
//                 "category": "AI & Data Science"
//             },
//             {
//                 "id": 10,
//                 "name": "The Pragmatic Programmer",
//                 "description": "<p>The Pragmatic Programmer</p>",
//                 "price": "259.00",
//                 "discount": 35,
//                 "price_after_discount": 168.35,
//                 "stock": 77,
//                 "best_seller": 23,
//                 "image": "https://codingarabic.online/storage/product/EJlnwrO9f0riZ6eqLwLU4Skp9VL4rzXR982wimeS.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 11,
//                 "name": "System Design Interview, An Insider’s Guide, Volume 2",
//                 "description": "<p>System Design Interview, An Insider’s Guide, Volume 2</p>",
//                 "price": "289.00",
//                 "discount": 30,
//                 "price_after_discount": 202.3,
//                 "stock": 77,
//                 "best_seller": 23,
//                 "image": "https://codingarabic.online/storage/product/UsHipB42fz3SepcBjCPqddEKjKHH3T9Z0QJxlrdI.png",
//                 "category": "Software"
//             },
//             {
//                 "id": 13,
//                 "name": "Practical Statistics for Data Scientists",
//                 "description": "<p>Practical Statistics for Data Scientists</p>",
//                 "price": "259.00",
//                 "discount": 40,
//                 "price_after_discount": 155.4,
//                 "stock": 85,
//                 "best_seller": 15,
//                 "image": "https://codingarabic.online/storage/product/JGQ1GLsrKZW4rEti21BdQyaZfOOHzz5oeolEA74X.jpg",
//                 "category": "Software"
//             }
//         ]
//     },
//     "message": "",
//     "error": [],
//     "status": 200
// }