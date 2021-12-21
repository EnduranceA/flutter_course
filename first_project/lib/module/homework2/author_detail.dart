import 'package:first_project/module/homework2/model/message.dart';
import 'package:first_project/module/homework2/theme_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:styled_widget/styled_widget.dart';
import 'message_store.dart';

class AuthorDetail extends StatefulWidget {
  const AuthorDetail({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  _AuthorDetailState createState() => _AuthorDetailState();
}

class _AuthorDetailState extends State<AuthorDetail> {
  final MessageStore _messageStore = Modular.get<MessageStore>();
  final ThemeStore _themeStore = Modular.get<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Все сообщения от " + widget.message.author),
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
            child: Column(children: [
          Expanded(child: Observer(builder: (context) {
            String author = widget.message.author;
            List<Message> messages =
                _messageStore.getMessagesFromAuthor(author);
            return AnimatedList(
              initialItemCount: messages.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                Message message = messages[index];
                return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                    ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.bounceIn,
                        reverseCurve: Curves.bounceOut)),
                    child: Padding(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Colors.indigo, spreadRadius: 2),
                          ],
                        ),
                        child: ListTile(
                          title: Text(message.message)
                              .fontSize(16.0)
                              .width(100)
                              .animate(const Duration(milliseconds: 300),
                                  Curves.linear),
                        ),
                      ),
                      padding: const EdgeInsets.all(15.0),
                    ));
              },
            );
          }))
        ])));
  }
}
