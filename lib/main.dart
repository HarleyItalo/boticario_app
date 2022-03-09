import 'package:boticario_app/modules/app/init_modules.dart';

import 'modules/app/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  InitModules().init();
  runApp(const App());
}
