import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeData themeData = ThemeData.light();

  @action
  void changeTheme() {
    if (themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}