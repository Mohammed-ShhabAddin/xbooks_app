import 'package:json_annotation/json_annotation.dart';

part 'new_arrivals.g.dart';

@JsonSerializable()
class NewArrivals {
  Data? data;
  String? message;
  List? error;
  int? status;

  NewArrivals({this.message, this.data, this.status, this.error});

  factory NewArrivals.fromJson(Map<String, dynamic> json) =>
      _$NewArrivalsFromJson(json);
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
//                 "id": 51,
//                 "name": "Mathematics for Machine Learning.2",
//                 "description": "<p>The fundamental mathematical tools needed to understand machine learning include linear algebra, analytic geometry, matrix decompositions, vector calculus, optimization, probability and statistics. These topics are traditionally taught in disparate courses, making it hard for data science or computer science students, or professionals, to efficiently learn the mathematics.&nbsp;</p>",
//                 "price": "279.00",
//                 "discount": 40,
//                 "price_after_discount": 167.4,
//                 "stock": 88,
//                 "best_seller": 12,
//                 "image": "https://codingarabic.online/storage/product/EtjZkMB5Hd0C8LaO38deoxRlOeVKazBYfNHFGtgz.png",
//                 "category": "AI & Data Science"
//             },
//             {
//                 "id": 50,
//                 "name": "Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow.2",
//                 "description": "<p>Through a recent series of breakthroughs, deep learning has boosted the entire field of machine learning. Now, even programmers who know close to nothing about this technology can use simple, efficient tools to implement programs capable of learning from data. This bestselling book uses concrete examples, minimal theory, and production-ready Python frameworks (Scikit-Learn, Keras, and TensorFlow) to help you gain an intuitive understanding of the concepts and tools for building intelligent systems.</p>",
//                 "price": "489.00",
//                 "discount": 35,
//                 "price_after_discount": 317.85,
//                 "stock": 85,
//                 "best_seller": 15,
//                 "image": "https://codingarabic.online/storage/product/S88HumLiCxYm8v1vI5JgiLjuxlkrvtKyJPIBv11J.jpg",
//                 "category": "AI & Data Science"
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
//                 "id": 48,
//                 "name": "Storytelling with Data.2",
//                 "description": "<p>Don’t simply show your data—tell a story with it!&nbsp;Storytelling with Data&nbsp;teaches you the fundamentals of data visualization and how to communicate effectively with data. You’ll discover the power of storytelling and the way to make data a pivotal point in your story. The lessons in this illuminative text are grounded in theory, but made accessible through numerous real-world examples—ready for immediate application to your next graph or presentation.</p>",
//                 "price": "229.00",
//                 "discount": 40,
//                 "price_after_discount": 137.4,
//                 "stock": 97,
//                 "best_seller": 3,
//                 "image": "https://codingarabic.online/storage/product/1gIl1eHvBM03raGQcK1HG5gGaqlpomcoLdTSgkvy.jpg",
//                 "category": "AI & Data Science"
//             },
//             {
//                 "id": 47,
//                 "name": "Head First Data Analysis.2",
//                 "description": "<p>Today, interpreting data is a critical decision-making factor for businesses and organizations. If your job requires you to manage and analyze all kinds of data, turn to&nbsp;Head First Data Analysis, where you’ll quickly learn how to collect and organize data, sort the distractions from the truth, find meaningful patterns, draw conclusions, predict the future, and present your findings to others.</p>",
//                 "price": "309.00",
//                 "discount": 45,
//                 "price_after_discount": 169.95,
//                 "stock": 99,
//                 "best_seller": 1,
//                 "image": "https://codingarabic.online/storage/product/dMGLIAoMgUr8T6QzQszM1QgTYBCHBavPSmT60N8w.jpg",
//                 "category": "AI & Data Science"
//             },
//             {
//                 "id": 46,
//                 "name": "Practical Statistics for Data Scientists.2",
//                 "description": "<p>Statistical methods are a key part of data science, yet few data scientists have formal statistical training. Courses and books on basic statistics rarely cover the topic from a data science perspective. The second edition of this popular guide adds comprehensive examples in Python, provides practical guidance on applying statistical methods to data science, tells you how to avoid their misuse, and gives you advice on what’s important and what’s not.</p>",
//                 "price": "259.00",
//                 "discount": 35,
//                 "price_after_discount": 168.35,
//                 "stock": 97,
//                 "best_seller": 3,
//                 "image": "https://codingarabic.online/storage/product/ODp66DZJ9YWCMYOPujTwayuZXu1Mkvq7gY3PLbkG.jpg",
//                 "category": "AI & Data Science"
//             }
//         ]
//     },
//     "message": "",
//     "error": [],
//     "status": 200
// }