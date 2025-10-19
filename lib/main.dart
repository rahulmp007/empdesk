
import 'package:empdesk/src/app/startup/initializer.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializer();
}
