import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(height: 30),
        Text('Circular progress indicator'),
        SizedBox(height: 10),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black45,
        ),
        SizedBox(height: 20),
        Text('Controlled progress indicator'),
        SizedBox(height: 10),
        _ConntrolledProgressIndicator()
      ]),
    );
  }
}

class _ConntrolledProgressIndicator extends StatelessWidget {
  const _ConntrolledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value <= 1),
        builder: (context, snapshot) {
          final double progressValue = snapshot.data != null
              ? double.parse(snapshot.data.toString())
              : 0.0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black26,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              )
            ]),
          );
        });
  }
}
