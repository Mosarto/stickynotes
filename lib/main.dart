import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stickynotes/data/routes.dart';

import 'package:stickynotes/widget/backgourd_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final BackgourdController backgourdController =
      Get.put(BackgourdController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sticky Notes',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        fontFamily: 'Outfit',
        primarySwatch: Colors.green,
      ),
    );
  }
}
