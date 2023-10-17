import 'package:coffee/core/config/get_it.dart';
import 'package:coffee/core/model/product_model.dart';
import 'package:coffee/core/service/product_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ProductModel> products;

  @override
   initState()  {
    super.initState();
    dynamic temp =  storage.get<ProductServiceImpl>().getProduct();

    products = List.generate(
        5, (index) => ProductModel.fromMap(temp));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF230C02),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEDCC6),
        leading: Icon(Icons.search),
        title: Text(
          'Deserunt commodo ',
          style: TextStyle(
            color: Color(0xFF230C02),
          ),
        ),
        actions: [Icon(Icons.notification_add), Icon(Icons.list)],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Column(
            children: [
              Text(
                  'Pariatur nostrud amet deserunt sit \n fugiat aliqua eiusmod amet.',
                  style: TextStyle(color: Color(0xFF230C02))),
              SizedBox(
                width: double.maxFinite,
                height: 100,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                        child: Text("Bla Bla"),
                      ),
                      width: 75,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: (index == 0)
                            ? Color(0xFF230C02)
                            : Color(0xFFEEDCC6),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: ListTile(
                title: Text(products[index].title),
                subtitle: Text(products[index].description),
                trailing: Text(products[index].brand)),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home')
      ]),
    );
  }
}
