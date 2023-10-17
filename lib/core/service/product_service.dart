import 'package:coffee/core/config/get_header.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ProductService {
  Dio dio =Dio() ;
  String baseURL = 'https://dummyjson.com/products/1';

  Future getProduct();


}
class ProductServiceImpl extends ProductService {
  @override
  Future getProduct()async {
    Response response = await dio.get(baseURL,options: HeaderService.getHeader(true));
    if(response.statusCode == 200){
      print(response);
      return response.data;

    }
    else {
      print('object');
      return 'Error';
    }
  }

}