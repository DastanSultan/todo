import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() => runApp(const Todo());

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoView(),
    );
  }
}
