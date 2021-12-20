import 'package:first_project/module/home/home_page.dart';
import 'package:first_project/module/homework1/first_homework.dart';
import 'package:first_project/module/homework2/second_homework.dart';
import 'package:first_project/module/homework2/second_homework_module.dart';
import 'package:first_project/module/homework3/third_homework.dart';
import 'package:first_project/module/homework3/third_homework_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(title: 'Домашние работы')),
        ChildRoute(FirstHomework.routeName,
            child: (context, args) => const FirstHomework(),
            transition: TransitionType.leftToRightWithFade),
        ModuleRoute(SecondHomework.routeName, module: SecondHomeworkModule(),
            transition: TransitionType.leftToRightWithFade),
        ModuleRoute(ThirdHomework.routeName,
            module: ThirdHomeworkModule(),
            transition: TransitionType.leftToRightWithFade),
      ];
}
