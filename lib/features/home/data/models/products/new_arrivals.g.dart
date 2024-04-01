// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_arrivals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewArrivals _$NewArrivalsFromJson(Map<String, dynamic> json) => NewArrivals(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      error: json['error'] as List<dynamic>?,
    );

Map<String, dynamic> _$NewArrivalsToJson(NewArrivals instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      discount: json['discount'] as int?,
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      bestSeller: json['best_seller'] as int?,
      image: json['image'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'price_after_discount': instance.priceAfterDiscount,
      'stock': instance.stock,
      'best_seller': instance.bestSeller,
      'image': instance.image,
      'category': instance.category,
    };
