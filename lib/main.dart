import 'package:firebase_exapmle/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Email",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Password",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: Colors.red,
              minWidth: 200,
              height: 50,
              onPressed: () async {
                // try {
                //   final credential = await FirebaseAuth.instance
                //       .createUserWithEmailAndPassword(
                //     email: email.text,
                //     password: password.text,
                //   );
                // } on FirebaseAuthException catch (e) {
                //   if (e.code == 'weak-password') {
                //     print('The password provided is too weak.');
                //   } else if (e.code == 'email-already-in-use') {
                //     print('The account already exists for that email.');
                //   }
                // } catch (e) {
                //   print(e);
                // }
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  print("Sing in Done");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
