import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Big tip'),
      ),
      body: BigTip(
        child: Icon(Icons.cake),
        title: 'The cake is a lie',
        subtitle: 'Is this a Portal reference?',
        action: 'CALL GABEN',
        actionCallback: () => print('Ding dong'),
      ),
    );
  }
}
