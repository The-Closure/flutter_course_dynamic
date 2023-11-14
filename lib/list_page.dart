import 'package:animation_tween/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List items = [];

  void addItem() {
    items.insert(
        items.isEmpty ? 0 : items.length - 1, "item ${items.length + 1}");
    key.currentState!.insertItem(
      items.isEmpty ? 0 : items.length - 1,
      duration: const Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    items.removeAt(index);
    key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.red,
            child: Text(
              "Deleted",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      );
    });
  }

  bool isChanged = false;

  GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: isChanged,
              onChanged: (currenValue) {
                setState(
                  () {
                    isChanged = currenValue;
                  },
                );
                Provider.of<ThemeProvider>(context, listen: false)
                    .switchTheme();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
          Expanded(
            child: AnimatedList(
              key: key,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      title: Text(
                        items[index],
                        style: Theme.of(context).primaryTextTheme.headlineSmall,
                      ),
                      leading: IconButton(
                          onPressed: () {
                            removeItem(index);
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
          ),
          // Container(
          //   width: 300,
          //   height: 300,
          //   color: Colors.grey,
          //   child: Lottie.network(
          //     'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
          //     width: 200,
          //     height: 200,
          //   ),
          // ),
        ],
      ),
    );
  }
}
