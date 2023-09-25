import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myController = TextEditingController();
  String text = "";
  bool isPressed = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    print("=================== I am initState()");
  }

  @override
  void dispose() {
    print("======================= I am dispose()");
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: myController,
                validator: (String? value) {
                  if (value == "") {
                    return "Please Enter Your Information";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value == "") {
                    return "Please Enter Your Information";
                  } else {
                    return null;
                  }
                },
                obscureText: isPressed,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    icon: isPressed == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SecondPage();
                        },
                      ),
                    );
                  } else {}
                },
                child: const Text("Go To Second Page"),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go To Previous Page")),
        ),
      ),
    );
  }
}
