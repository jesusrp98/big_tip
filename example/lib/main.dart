// ignore_for_file: avoid_print

import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'big_tip',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Big tip'),
      ),
      body: BigTip(
        title: const Text('The cake is a lie'),
        subtitle: const Text('Is this a Portal reference?'),
        action: TextButton(
          child: const Text('CALL GABEN'),
          onPressed: () => print('Ding dong'),
        ),
        child: const Icon(Icons.cake_outlined),
      ),
    );
  }
}
