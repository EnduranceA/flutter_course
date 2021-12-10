import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'image_store.dart';
import 'model/my_image.dart';

class ThirdHomework extends StatefulWidget {
  const ThirdHomework({Key? key}) : super(key: key);

  static String routeName = '/third_homework';

  @override
  _ThirdHomeworkState createState() => _ThirdHomeworkState();
}

class _ThirdHomeworkState extends State<ThirdHomework> {
  final ImageStore _imageStore = Modular.get<ImageStore>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашнаяя работа №3. Image Gallery + Animation'),
        actions: [
          IconButton(
            onPressed: () {
              _imageStore.pickImageFromGallery(addItem: () {
                _listKey.currentState!
                    .insertItem(_imageStore.images.length - 1);
              });
            },
            icon: const Icon(Icons.image_outlined),
          ),
          IconButton(
              onPressed: () {
                _imageStore.pickImageFromCamera(addItem: () {
                  _listKey.currentState!
                      .insertItem(_imageStore.images.length - 1);
                });
              },
              icon: const Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Observer(
              builder: (context) {
                return AnimatedList(
                  key: _listKey,
                  initialItemCount: _imageStore.images.length,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    MyImage img = _imageStore.images[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0),
                      ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn,
                          reverseCurve: Curves.bounceOut)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/third_homework/detail', arguments: img);
                            },
                            child: Center(
                                child: Hero(
                              tag: img.name,
                              child: img.image,
                            ))),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
