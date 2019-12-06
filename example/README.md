```
import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        icon: Icons.cake,
        message: 'The cake is a lie',
        messageStyle: TextStyle(
          fontSize: 27,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
```
