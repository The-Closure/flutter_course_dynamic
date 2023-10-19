import 'package:flutter/material.dart';
import 'package:pro_state/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          context.watch<CounterProvider>().count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
