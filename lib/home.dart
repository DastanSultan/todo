import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

List<String> alle = [];

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();
    load();
  }

  TextEditingController textFieldController = TextEditingController();
  Future<void> save() async {
    SharedPreferences pfer = await SharedPreferences.getInstance();
    pfer.setStringList("alles", alle);
  }

  Future<void> load() async {
    SharedPreferences pfer = await SharedPreferences.getInstance();
    List<String> data = pfer.getStringList("alles") ?? [];
    setState(() {
      alle = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Если не сегодня, то когда",
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff144272),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: GridView.builder(
                      itemCount: alle.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 9),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onDoubleTap: () {
                            setState(() {
                              alle.removeAt(index);
                              save();
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff002B5B),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 30, top: 15, right: 30),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    alle[index].length <= 10
                                        ? '${alle[index].toUpperCase()}'
                                        : '${alle[index].toUpperCase().substring(0, 7)}...',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 30, top: 5, right: 30),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    alle[index].length <= 70
                                        ? "${alle[index]}"
                                        : alle[index].substring(0, 70) + "...",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      hintText: "Введите новую заметку",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (textFieldController.text != "") {
                        alle.add(textFieldController.text);
                        save();
                        textFieldController.text = "";
                      } else {
                        print("Empty");
                        print(
                            "Введите новую заметкуВведите новую Введите новую заметкуВведите новую Введите "
                                .length);
                      }
                    });
                  },
                  child: Icon(
                    Icons.near_me,
                    size: 35,
                    color: Color(0xff1D2B53),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
