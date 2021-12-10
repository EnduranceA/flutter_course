// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImageStore on _ImageStore, Store {
  final _$imagesAtom = Atom(name: '_ImageStore.images');

  @override
  ObservableList<MyImage> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<MyImage> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$pickImageFromGalleryAsyncAction =
      AsyncAction('_ImageStore.pickImageFromGallery');

  @override
  Future pickImageFromGallery({Function? addItem}) {
    return _$pickImageFromGalleryAsyncAction
        .run(() => super.pickImageFromGallery(addItem: addItem));
  }

  final _$pickImageFromCameraAsyncAction =
      AsyncAction('_ImageStore.pickImageFromCamera');

  @override
  Future pickImageFromCamera({Function? addItem}) {
    return _$pickImageFromCameraAsyncAction
        .run(() => super.pickImageFromCamera(addItem: addItem));
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
