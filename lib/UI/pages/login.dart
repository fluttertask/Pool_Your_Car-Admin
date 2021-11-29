import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/Src/models/admin_model.dart';
import 'package:adminapp/UI/components/custom_text_field.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AdminModel adminDetails = AdminModel();
  ApiControllers apiControllers = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: SizeConfig.of(context).getScreenHeight(15)),
          const SizedBox(
            child: Text(
              'Pool Your Car',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'Login as Admin',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),

          SizedBox(height: SizeConfig.of(context).getScreenHeight(8)),

          CustomTextField(
            icon: Icons.person,
            onText: (text){
              adminDetails.email = text;
            },
          ),

          CustomTextField(
            icon: Icons.lock,
            onText: (text){
              adminDetails.password = text;
            },
          ),
          
          Container(
            margin: EdgeInsets.all(SizeConfig.of(context).getScreenWidth(10)),
            width: size.width - 80,
            height: size.height/15,
            child: TextButton(
              onPressed: (){
                if (adminDetails.email == null || adminDetails.email == '') {
                  return;
                }
                if (adminDetails.password == null || adminDetails.password =='') {
                  return;
                }
                apiControllers.login(adminDetails).then(
                  (value){
                    if (apiControllers.currentUser.value.email != null){
                      Get.offAllNamed(Routes.home);
                    }
                  }
                );
                
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )
              ),
              child: Text(
                'Login',
                style: TextStyle(
                fontSize: 20,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}