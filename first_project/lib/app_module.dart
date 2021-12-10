import 'package:first_project/module/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'module/homework2/theme_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ThemeStore())];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
