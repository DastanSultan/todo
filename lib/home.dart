import 'package:flutter/material.dart';

// ignore: camel_case_types
class todoView extends StatefulWidget {
  const todoView({super.key});

  @override
  State<todoView> createState() => _todoViewState();
}

List<Widget> all_list = [];

// ignore: camel_case_types
class _todoViewState extends State<todoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff000000),
      appBar: PreferredSize(
        preferredSize: Size(0, 0),
        child: AppBar(
          title: const Text(""),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Бүгүнкү иштер",
            style: TextStyle(
                fontFamily: "PlayfairDisplay",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#Баардыгы",
                  style: TextStyle(
                      fontFamily: "Bitter",
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print("object");
                      all_list.add(
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xffD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Жашоо",
                                      style: TextStyle(
                                          fontFamily: "Bitter",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: all_list,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
