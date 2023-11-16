import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:more_widgets/model/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<CartModel> carts = List.generate(
              temp['carts'].length,
              (index) => CartModel.fromMap(
                temp['carts'][index],
              ),
            );
            return ListView.builder(itemBuilder: (context, index) {
              List<ProductModel> products = List.generate(
                carts[index].products.length,
                (ind) =>
                    ProductModel.fromMap(carts[index].products[ind].toMap()),
              );
              return ExpansionTile(
                  title: Text("Product $index"),
                  children: List.generate(
                      products.length,
                      (index) => ListTile(
                            title: Text(products[index].title),
                          )));
            });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

getData() async {
  Dio dio = Dio();
  Response response = await dio.get("https://dummyjson.com/carts");
  print(response.data);
  return response.data;
}
