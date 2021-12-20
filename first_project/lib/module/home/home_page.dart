import 'package:first_project/module/homework1/first_homework.dart';
import 'package:first_project/module/homework2/second_homework.dart';
import 'package:first_project/module/homework2/theme_store.dart';
import 'package:first_project/module/homework3/third_homework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Homework {
  final String title;
  final String route;
  final WidgetBuilder builder;

  const Homework({
    required this.title,
    required this.route,
    required this.builder,
  });
}

final allHomeworks = [
  Homework(
      title: 'Домашняя работа №1. Widgets',
      route: FirstHomework.routeName,
      builder: (context) => const FirstHomework()),
  Homework(
      title: 'Домашняя работа №2. API + State Management',
      route: SecondHomework.routeName,
      builder: (context) => const SecondHomework()),
  Homework(
      title: 'Домашняя работа №3. Gallery + Animation',
      route: ThirdHomework.routeName,
      builder: (context) => const ThirdHomework())
];

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final ThemeStore _themeStore = Modular.get<ThemeStore>();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(title),
        actions: [
          GestureDetector(
            child: const Icon(Icons.assistant_photo_outlined),
            onTap: () {
              _themeStore.changeTheme();
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ...allHomeworks.map((h) => HomeworkTile(homework: h))
        ],
      ),
    );
  }
}

class HomeworkTile extends StatelessWidget {
  final Homework homework;

  const HomeworkTile({required this.homework, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(homework.title),
      onTap: () {
        Modular.to.pushNamed(homework.route);
      },
    );
  }
}