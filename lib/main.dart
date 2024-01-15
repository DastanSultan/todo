import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() => runApp(todo());

// ignore: camel_case_types
class todo extends StatelessWidget {
  const todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoView(),
    );
  }
}
