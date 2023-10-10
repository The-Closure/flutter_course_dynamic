import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localiztion/config/string.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translation', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(colorSchemeSeed: Colors.orange[200], useMaterial3: true),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: MyHomePage(title: 'Easy Translate'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> names = ["Ahmad", "Basel", "Alaa", "Nabil"];

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppStrings().TITLE),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: ReorderableListView.builder(
                itemCount: names.length,
                onReorder: (oldIndex, newIndex) {
                  // String temp = names[oldIndex];
                  // setState(() {
                  //  names.removeAt(oldIndex);
                  //  names.insert(newIndex-1, temp);
                  // });
      
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String widget = names.removeAt(oldIndex);
                    names.insert(newIndex, widget);
                  });
                },
                itemBuilder: (context, index) => ListTile(
                  key: GlobalKey(),
                  title: Text(names[index]),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListWheelScrollView(magnification: 2,useMagnifier: true,itemExtent: 15, children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red[200],
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red[200],
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red[200],
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red[200],
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red[200],
                )
              ]),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.locale.languageCode == 'ar') {
            context.setLocale(Locale('en'));
          } else {
            context.setLocale(Locale('ar'));
          }
        },
        tooltip: 'Increment'.tr(),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
