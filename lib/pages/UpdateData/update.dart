import 'package:flutter/material.dart';
import 'package:pro_state/providers/update_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Update extends StatelessWidget {
  Update({super.key});
  TextEditingController updateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.watch<UpdateProvider>().name),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: updateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UpdateProvider>().update(
                      newName: updateController.text,
                    );
              },
              child: const Text(
                "Update",
              ),
            )
          ],
        ),
      ),
    );
  }
}
