import 'package:animation_tween/list_page.dart';
import 'package:animation_tween/theme/theme.dart';
import 'package:animation_tween/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: Provider.of<ThemeProvider>(context).themeData,
          home: const ListPage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isFav = false;
  Color color = Colors.blue;
  double width = 400;
  double opacity = 1;
  double padding = 20;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> curve;

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(curve);

    sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
            tween: Tween<double>(begin: 200, end: 300), weight: 50),
        TweenSequenceItem(
            tween: Tween<double>(begin: 300, end: 200), weight: 50),
      ],
    ).animate(curve);

    controller.addListener(() {
      print(controller.value);
      print(colorAnimation.value);
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(
          () {
            isFav = false;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Container(
                  color: Colors.amber,
                  width: 400,
                  height: 400,
                  child: IconButton(
                    onPressed: () {
                      isFav ? controller.reverse() : controller.forward();
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: sizeAnimation.value,
                      color: colorAnimation.value,
                    ),
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: width,
                  height: 400,
                  color: color,
                  duration: const Duration(seconds: 2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              color = Colors.green;
                              opacity = 1;
                            });
                          },
                          child: const Text("Change Color"),
                        ),
                        MaterialButton(
                          color: Colors.purple,
                          onPressed: () {
                            setState(() {
                              width = 700;
                              opacity = 0;
                            });
                          },
                          child: const Text("Change Width"),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  curve: Curves.easeInOutCirc,
                  duration: const Duration(seconds: 2),
                  opacity: opacity,
                  child: const Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                AnimatedPadding(
                  curve: Curves.bounceInOut,
                  padding: EdgeInsets.all(padding),
                  duration: const Duration(seconds: 1),
                  child: Container(
                    color: Colors.black,
                    width: 200,
                    height: 200,
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            padding = 100;
                          });
                        },
                        color: Colors.yellow,
                        minWidth: 50,
                        height: 50,
                        child: const Text("Change Padding"),
                      ),
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  curve: Curves.slowMiddle,
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Padding(
                      padding: EdgeInsets.only(top: value * 50),
                      child: Opacity(
                        opacity: value,
                        child: const Text(
                          "Hello",
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
