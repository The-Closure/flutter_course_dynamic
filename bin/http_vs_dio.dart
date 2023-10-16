import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'post_service.dart';
import 'user_model.dart';

void main() async {

await login('Ahmad', 'Doctor');

  dynamic temp = await fetchImages();

  List<ProductModel> products = List.generate(temp.length, (index) => ProductModel.fromMap(temp[index]));

products.forEach((element) {
  print(element);
});

  // String temp1 = await fetchUsers();

  // List<UserModelProfessional> users = List.generate(
  //     temp1.length, (index) => UserModelProfessional.fromMap(temp[index]));

// ListUserModel users = ListUserModel.fromMap(temp);

//   print(users);
}
// print(await fetchImages());}

// ?  GET with http package
fetchUsers() async {
  Uri baseurl = Uri.http('jsonplaceholder.typicode.com', 'users');
  http.Response response = await http.get(baseurl);

  if (response.statusCode == 200) {
    print('----------------');
    return response.body;
  } else {
    return 'ma mshe alhal';
  }
}

class ProductModel {
  int id;
  String title;
  double price;
  String image;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'price': price});
    result.addAll({'image': image});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ price.hashCode ^ image.hashCode;
  }
}

// ? GET with dio package

fetchImages() async {
  Dio serviceLayer = Dio();

  Response response = await serviceLayer.get(
      'https://fakestoreapi.com/products',
      options: Options(headers: {'content-type': 'application/json'}));

  if (response.statusCode == 200) {
    return response.data;
  } else {
    return 'ma mshe alhal';
  }
}

class ListUserModel {
  List<UserModelProfessional> user;
  ListUserModel({
    required this.user,
  });

  ListUserModel copyWith({
    List<UserModelProfessional>? user,
  }) {
    return ListUserModel(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'user': user.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ListUserModel.fromMap(Map<String, dynamic> map) {
    return ListUserModel(
      user: List<UserModelProfessional>.from(
          map['user']?.map((x) => UserModelProfessional.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListUserModel.fromJson(String source) =>
      ListUserModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListUserModel(user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ListUserModel && listEquals(other.user, user);
  }

  @override
  int get hashCode => user.hashCode;
}

class UserModelProfessional {
  int id;
  String name;
  String username;
  String email;
  UserModelProfessional({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  UserModelProfessional copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
  }) {
    return UserModelProfessional(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'username': username});
    result.addAll({'email': email});
  
    return result;
  }

  factory UserModelProfessional.fromMap(Map<String, dynamic> map) {
    return UserModelProfessional(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelProfessional.fromJson(String source) => UserModelProfessional.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModelProfessional(id: $id, name: $name, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModelProfessional &&
      other.id == id &&
      other.name == name &&
      other.username == username &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode;
  }
}


class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  AddressModel copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
  }) {
    return AddressModel(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'street': street});
    result.addAll({'suite': suite});
    result.addAll({'city': city});
    result.addAll({'zipcode': zipcode});

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] ?? '',
      suite: map['suite'] ?? '',
      city: map['city'] ?? '',
      zipcode: map['zipcode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(street: $street, suite: $suite, city: $city, zipcode: $zipcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode;
  }

  @override
  int get hashCode {
    return street.hashCode ^ suite.hashCode ^ city.hashCode ^ zipcode.hashCode;
  }
}
