// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartModel {
  final int id;
  final List<ProductModel> products;
  CartModel({
    required this.id,
    required this.products,
  });

  CartModel copyWith({
    int? id,
    List<ProductModel>? products,
  }) {
    return CartModel(
      id: id ?? this.id,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      products: List<ProductModel>.from(
        (map['products'] as List<dynamic>).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(id: $id, products: $products)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id && listEquals(other.products, products);
  }

  @override
  int get hashCode => id.hashCode ^ products.hashCode;
}

class ProductModel {
  final int id;
  final String title;
  final num price;
  final num quantity;
  final num total;
  final num discountPercentage;
  final num discountedPrice;
  final dynamic thumbnail;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    num? price,
    num? quantity,
    num? total,
    num? discountPercentage,
    num? discountedPrice,
    dynamic thumbnail,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedPrice': discountedPrice,
      'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      quantity: map['quantity'] as num,
      total: map['total'] as num,
      discountPercentage: map['discountPercentage'] as num,
      discountedPrice: map['discountedPrice'] as num,
      thumbnail: map['thumbnail'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedPrice: $discountedPrice, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.quantity == quantity &&
        other.total == total &&
        other.discountPercentage == discountPercentage &&
        other.discountedPrice == discountedPrice &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        total.hashCode ^
        discountPercentage.hashCode ^
        discountedPrice.hashCode ^
        thumbnail.hashCode;
  }
}
