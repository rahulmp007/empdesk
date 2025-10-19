import 'package:empdesk/src/app/presentation/page/splash.dart';
import 'package:flutter/material.dart';

class EmpDesk extends StatelessWidget {
  const EmpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmpDesk',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
