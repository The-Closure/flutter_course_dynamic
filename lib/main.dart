import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliver_page/app/get_it.dart';
import 'package:sliver_page/app/storage.dart';

 main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
 await setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SecondPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FlutterLogo(),
          SliverAppBar(
            bottom: AppBar(title: Text("hello")),
            snap: true,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            centerTitle: true,
            title: Text("Hello world"),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text(index.toString()),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
          ),
          SliverToBoxAdapter(
            child: Expanded(
                child: Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            )),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            children: [
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
            ],
          ),
          SliverGrid.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 80),
            itemBuilder: (context, index) => CircleAvatar(
              child: Text(
                index.toString(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

TextEditingController data = TextEditingController();

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: data,
          ),
          IconButton(
              onPressed: () {
                getIt.get<SharedPreferences>().setString('pure_data', data.text);
              },
              icon: Icon(Icons.save)),
          // SizedBox(
          //   height: 700,
          //   width: double.maxFinite,
          //   child: GridView.builder(
          //     itemCount: 20,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         mainAxisSpacing: 8,
          //         crossAxisSpacing: 8,
          //         childAspectRatio: 4),
          //     itemBuilder: (context, index) => Container(
          //       child: Center(child: Text(index.toString())),
          //       color: Colors.red,
          //       width: 60,
          //       height: 60,
          //     ),
          //   ),
          // ),
        Text(getIt.get<SharedPreferences>().getString('pure_data')?? 'hello')
        ],
      ),
    );
  }
}
