import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

//This model could be used with search too
// I mean this model also used for search GET request

@JsonSerializable()
class Products {
  Data? data;
  String? message;
  List? error;
  int? status;

  Products({this.message, this.data, this.status, this.error});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}

@JsonSerializable()
class Data {
  List<Product>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});
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
//                 "id": 12,
//                 "name": "Fundamentals of Software Architecture, An Engineering Approach",
//                 "description": "<p>Fundamentals of Software Architecture, An Engineering Approach</p>",
//                 "price": "289.00",
//                 "discount": 30,
//                 "price_after_discount": 202.3,
//                 "stock": 89,
//                 "best_seller": 11,
//                 "image": "https://codingarabic.online/storage/product/QMKlfPvseR6iaemqhA48sIOPEzhxaw7dvzASRHE8.jpg",
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
//             },
//             {
//                 "id": 14,
//                 "name": "Domain-Driven Design",
//                 "description": "<p>Domain-Driven Design</p>",
//                 "price": "339.00",
//                 "discount": 35,
//                 "price_after_discount": 220.35,
//                 "stock": 86,
//                 "best_seller": 14,
//                 "image": "https://codingarabic.online/storage/product/JZ0NEBkv3Op5nwif8YK4g2twXkiLNdnhzUTale18.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 15,
//                 "name": "The Object-Oriented Thought Process",
//                 "description": "<p>The Object-Oriented Thought Process</p>",
//                 "price": "209.00",
//                 "discount": 35,
//                 "price_after_discount": 135.85,
//                 "stock": 94,
//                 "best_seller": 6,
//                 "image": "https://codingarabic.online/storage/product/l0kkykSGLKfrE90Vkah6LD8briUKwp0V5nvPvEI1.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 16,
//                 "name": "Refactoring",
//                 "description": "<p>For more than twenty years, experienced programmers worldwide have relied on Martin Fowler’s Refactoring to improve the design of existing code and to enhance software maintainability, as well as to make existing code easier to understand. This eagerly awaited new edition has been fully updated to reflect crucial changes in the programming landscape. Refactoring, Second Edition, features an updated catalog of refactoring’s and includes JavaScript code examples, as well as new functional examples that demonstrate refactoring without classes.</p>",
//                 "price": "289.00",
//                 "discount": 40,
//                 "price_after_discount": 173.4,
//                 "stock": 90,
//                 "best_seller": 10,
//                 "image": "https://codingarabic.online/storage/product/KVDGvRjmcn7Epi4Xcx6d5mu6Ayw6x6ad3H20TSga.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 17,
//                 "name": "Head First Data Analysis",
//                 "description": "<p>Head First Data Analysis</p>",
//                 "price": "309.00",
//                 "discount": 35,
//                 "price_after_discount": 200.85,
//                 "stock": 95,
//                 "best_seller": 5,
//                 "image": "https://codingarabic.online/storage/product/VzfCy8YgItBhN4oKabmjT8COAdHZ5YVMswctDJb5.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 18,
//                 "name": "Storytelling with Data",
//                 "description": "<p>Storytelling with Data</p>",
//                 "price": "229.00",
//                 "discount": 35,
//                 "price_after_discount": 148.85,
//                 "stock": 97,
//                 "best_seller": 3,
//                 "image": "https://codingarabic.online/storage/product/xKXpIXra12x6VTUMtpetaWcLKvwicm49ZY7YRbJz.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 19,
//                 "name": "You Don’t Know JS",
//                 "description": "<p>It’s easy to learn parts of JavaScript, but much harder to learn it completely—or even sufficiently—whether you’re new to the language or have used it for years. With the “You Don’t Know JS” book series, you’ll get a more complete understanding of JavaScript, including trickier parts of the language that many experienced JavaScript programmers simply avoid.</p>",
//                 "price": "659.00",
//                 "discount": 50,
//                 "price_after_discount": 329.5,
//                 "stock": 100,
//                 "best_seller": 0,
//                 "image": "https://codingarabic.online/storage/product/0P6L0YYffLqbqGLlQxY9duDzokc8g7k8y8jngyB6.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 20,
//                 "name": "Design Patterns",
//                 "description": "<p>Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems. Previously undocumented, these 23 patterns allow designers to create more flexible, elegant, and ultimately reusable designs without having to rediscover the design solutions themselves.</p>",
//                 "price": "297.00",
//                 "discount": 30,
//                 "price_after_discount": 207.9,
//                 "stock": 99,
//                 "best_seller": 1,
//                 "image": "https://codingarabic.online/storage/product/ytZLPQhy0N7uThLTew5LbQv78JB872LYh8e4tbZA.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 21,
//                 "name": "Introduction to Algorithms",
//                 "description": "<p>Introduction to Algorithms</p>",
//                 "price": "669.00",
//                 "discount": 50,
//                 "price_after_discount": 334.5,
//                 "stock": 96,
//                 "best_seller": 4,
//                 "image": "https://codingarabic.online/storage/product/PMN7ycgJIo64ZX4DAXJJMBANA8RVCMJnBo3xw5C9.jpg",
//                 "category": "Software"
//             },
//             {
//                 "id": 22,
//                 "name": "The Clean Coder",
//                 "description": "<p>The Clean Coder</p>",
//                 "price": "209.00",
//                 "discount": 35,
//                 "price_after_discount": 135.85,
//                 "stock": 98,
//                 "best_seller": 2,
//                 "image": "https://codingarabic.online/storage/product/pdfciAUTe7iDSrHjebvnUIlV2D7pbzBBmJhqXAHF.jpg",
//                 "category": "Software"
//             }
//         ],
//         "meta": {
//             "total": 42,
//             "per_page": 15,
//             "current_page": 1,
//             "last_page": 3
//         },
//         "links": {
//             "first": "https://codingarabic.online/api/products?page=1",
//             "last": "https://codingarabic.online/api/products?page=3",
//             "prev": null,
//             "next": "https://codingarabic.online/api/products?page=2"
//         }
//     },
//     "message": "",
//     "error": [],
//     "status": 200
// }
