import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'homeworks/homework1/first_homework.dart';
import 'homeworks/homework2/second_homework.dart';
import 'homeworks/homework2/theme_store.dart';

void main() {
  runApp(MultiProvider(
      providers: [Provider<ThemeStore>(create: (_) => ThemeStore())],
      child: const MyApp()));
}

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
      builder: (context) => const SecondHomework())
];

final allRoutes = Map.fromEntries(allHomeworks.map((h) => MapEntry(h.route, h.builder)));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
          title: 'Домашние работы',
          theme: context.watch<ThemeStore>().themeData,
          routes: allRoutes,
          home: const MyHomePage(title: 'Домашние работы'));
    });
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
                context.read<ThemeStore>().changeTheme();
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
        Navigator.pushNamed(context, homework.route);
      },
    );
  }
}

