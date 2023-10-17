import 'dart:convert';

class ProductModel {
  String title;
  String description;
  String brand;
  ProductModel({
    required this.title,
    required this.description,
    required this.brand,
  });

  ProductModel copyWith({
    String? title,
    String? description,
    String? brand,
  }) {
    return ProductModel(
      title: title ?? this.title,
      description: description ?? this.description,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'brand': brand});
  
    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      brand: map['brand'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(title: $title, description: $description, brand: $brand)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.title == title &&
      other.description == description &&
      other.brand == brand;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ brand.hashCode;
}
