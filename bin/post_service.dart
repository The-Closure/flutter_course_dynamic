import 'dart:convert';

import 'package:dio/dio.dart';

login(String name, String jop) async {
  LogInModel reqData = LogInModel(name: name, jop: jop);

  Dio postService = Dio();

  Response response = await postService.post('https://5693-109-236-81-182.ngrok-free.app/users/add',
      data: reqData.toJson());

      if(response.data is String){
        print("Success");
      }
      else {
        print("ma mshe al7al");
      }
}

class LogInModel {
  String name;
  String jop;
  LogInModel({
    required this.name,
    required this.jop,
  });

  LogInModel copyWith({
    String? name,
    String? jop,
  }) {
    return LogInModel(
      name: name ?? this.name,
      jop: jop ?? this.jop,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'jop': jop});

    return result;
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      name: map['name'] ?? '',
      jop: map['jop'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) =>
      LogInModel.fromMap(json.decode(source));

  @override
  String toString() => 'LogInModel(name: $name, jop: $jop)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LogInModel && other.name == name && other.jop == jop;
  }

  @override
  int get hashCode => name.hashCode ^ jop.hashCode;
}
