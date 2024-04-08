// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      error: json['error'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products,
      'meta': instance.meta,
      'links': instance.links,
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

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
    )..lastPage = json['last_page'] as int?;

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'total': instance.total,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
