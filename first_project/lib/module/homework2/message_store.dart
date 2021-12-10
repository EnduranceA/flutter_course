import 'package:dio/dio.dart';
import 'package:first_project/module/homework2/model/message.dart';
import 'package:mobx/mobx.dart';

import 'api_client.dart';

part 'message_store.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  String url = 'https://itis-chat-app-ex.herokuapp.com/chat';

  @observable
  ObservableList<Message> messages = ObservableList.of([]);

  @action
  void getNewMessages() {
    RestClient restClient = RestClient(Dio());
    restClient.getMessages().then((List<Message> messages) {
        this.messages = ObservableList.of(messages);
    }).catchError((e) {
      print('Got error: $e');
    });
  }

  @action
  void sendMessage(Message message) {
    RestClient restClient = RestClient(Dio());
    restClient.sendMessage(message).then((Message message) {
      messages.add(message);
    }).catchError((e) {
      print('Got error: $e');
    });
  }
}