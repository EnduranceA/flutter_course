import 'package:first_project/module/homework2/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:styled_widget/styled_widget.dart';
import 'message_store.dart';
import 'model/message.dart';

class SecondHomework extends StatefulWidget {
  const SecondHomework({Key? key}) : super(key: key);

  static String routeName = '/second_homework';

  @override
  _SecondHomeworkState createState() => _SecondHomeworkState();
}

class _SecondHomeworkState extends State<SecondHomework> {
  final MessageStore _messageStore = Modular.get<MessageStore>();
  final ThemeStore _themeStore = Modular.get<ThemeStore>();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageStore.getNewMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашнаяя работа №2. API + State Management'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.assistant_photo_outlined),
            onTap: () {
              _themeStore.changeTheme();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Observer(builder: (context) {
              return ListView(
                  children: _messageStore.messages.map((message) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                "https://s3.o7planning.com/images/boy-128.png"),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  child: Text(message.author)
                                      .textColor(Colors.blueAccent)
                                      .fontSize(16.0)
                                      .fontWeight(FontWeight.bold)
                                      .width(100, animate: true)
                                      .animate(
                                          const Duration(milliseconds: 300),
                                          Curves.linear),
                                  onTap: () {
                                    Modular.to.pushNamed('/second_homework/detail', arguments: message);
                                  },),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(message.message),
                            ])
                      ],
                    ),
                  ),
                );
              }).toList());
            })),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Введите Ваше сообщение',
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
                    _addMessage(_textEditingController.text);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _addMessage(String text) {
    Message message = Message(author: 'Angelina', message: text);
    _messageStore.sendMessage(message);
    // очищение поля ввода
    _textEditingController.clear();
  }
}
