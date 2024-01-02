import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

/// To use Riverpod with a state [ConsumerWidget] instead StatefulWidget
class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
          child: Text(
        'Value: $counterValue',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // To update the state.
          // ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}
