import 'package:first_project/module/homework3/third_homework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_info.dart';
import 'image_store.dart';

class ThirdHomeworkModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ImageStore())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ThirdHomework()),
        ChildRoute('/detail_info',
            child: (context, args) => DetailInfo(img: args.data),
            transition: TransitionType.leftToRightWithFade)
      ];
}
