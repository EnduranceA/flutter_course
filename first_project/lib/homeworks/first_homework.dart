import 'package:flutter/material.dart';

class FirstHomework extends StatefulWidget {
  const FirstHomework({Key? key}) : super(key: key);

  static String routeName = '/homeworks/first_homework';

  @override
  _FirstHomeworkState createState() => _FirstHomeworkState();
}

class _FirstHomeworkState extends State<FirstHomework> {

  final List<String> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text){
    setState((){
      _messages.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Домашняя работа №1. Widgets')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                    child: ListView(
                        children: _messages.map((message) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(color: Colors.indigo, spreadRadius: 3),
                                ],
                              ),
                              child: ListTile(
                                title: Text(message),
                              ),
                            ),
                          );
                        }).toList()
                    ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Введите сообщение',
                        ),
                        controller: _textEditingController,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.add,
                      color: Colors.indigo,
                      size: 50.0,
                    ),
                    onTap: () {
                      _addToList(_textEditingController.text);
                    },
                  )
                ],
              )
            ]
          )
        )
      )
    );
  }
}
