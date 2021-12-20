import 'dart:math';

import 'package:first_project/module/homework3/model/my_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'image_store.g.dart';

class ImageStore = _ImageStore with _$ImageStore;

abstract class _ImageStore with Store {
  @observable
  ObservableList<MyImage> images = ObservableList.of([]);

  @action
  pickImageFromGallery({Function? addItem}) async {
    XFile? pickedPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    images.add(MyImage(
        name: getRandomString(5),
        image: Image.memory(await pickedPhoto!.readAsBytes())));
    images = ObservableList.of(images);
    addItem!();
  }

  @action
  pickImageFromCamera({Function? addItem}) async {
    XFile? pickedPhoto =
        await ImagePicker().pickImage(source: ImageSource.camera);
    images.add(MyImage(
        name: getRandomString(5),
        image: Image.memory(await pickedPhoto!.readAsBytes())));
    images = ObservableList.of(images);
    addItem!();
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
