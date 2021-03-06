import 'package:first_project/module/homework2/message_store.dart';
import 'package:first_project/module/homework2/second_homework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondHomeworkModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => MessageStore())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
        child: (context, args) => const SecondHomework())
  ];
}