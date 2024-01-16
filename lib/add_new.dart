// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class add_new extends StatefulWidget {
  const add_new({super.key});

  @override
  State<add_new> createState() => _add_newState();
}

TextEditingController controller = TextEditingController();

class _add_newState extends State<add_new> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            Center(child: Text("Новая заметка")),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
              ),
              child: TextField(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
