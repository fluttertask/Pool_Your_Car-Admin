import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/main.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
    
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences _pref;
  ApiControllers apiController = Get.find();
  
  Future<void> check() async {
    _pref = await SharedPreferences.getInstance();
    
    if (_pref.containsKey('user')){
      await apiController.init();
      Get.offNamed(Routes.home);
    }else{
       Get.offNamed(Routes.login);
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: SizedBox(
            child: Image.asset('assets/images/splashlogo.png')
          )
        )
      ),
    );
  }
}