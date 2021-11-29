import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ApiControllers apiController = Get.put(ApiControllers());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin Pool Your Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ).copyWith(
      ),
      initialRoute: Routes.splash,
      getPages: Routes.getPages,
    );
  }
}

