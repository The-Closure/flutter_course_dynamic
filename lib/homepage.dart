import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireBase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to FireBase"),
            ElevatedButton(
              onPressed: () async {
                DatabaseReference ref = FirebaseDatabase.instance.ref();
                await ref.update(
                  {
                    "ghina": 2010,
                    "derani": 'mazeh',
                    "add": 'street alabed',
                  },
                );

                // set Funaction
                // await ref.set(
                //   {
                //     "ghina": 2010,
                //     "derani": 'mazeh',
                //     "add": 'street alabed',
                //   },
                // );
              },
              child: const Text("Upadte data"),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  // Create a new user with a first and last name
                  final user = <String, dynamic>{
                    "first": "Ada",
                    "last": "Lovelace",
                    "born": 1815
                  };

// Add a new document with a generated ID
                  db.collection("users").add(user);
                },
                child: const Text('Upadte data with firestore'))
          ],
        ),
      ),
    );
  }
}
