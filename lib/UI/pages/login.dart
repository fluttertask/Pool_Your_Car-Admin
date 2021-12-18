import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/Src/models/admin_model.dart';
import 'package:adminapp/UI/components/custom_text_field.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:adminapp/routes.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
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
                  CherryToast.error(
                    toastDuration: const Duration(seconds: 3),
                    title: "",
                    enableIconAnimation: true,
                    displayTitle: false,
                    description: "Email Can't be Empty",
                    toastPosition: POSITION.BOTTOM,
                    animationDuration: const Duration(milliseconds: 2000),
                    autoDismiss: true,
                  ).show(context);
                  return;
                }
                if (adminDetails.password == null || adminDetails.password =='') {
                  CherryToast.error(
                        toastDuration: const Duration(seconds: 3),
                        title: "",
                        enableIconAnimation: true,
                        displayTitle: false,
                        description: "Password Can't be Empty",
                        toastPosition: POSITION.BOTTOM,
                        animationDuration: const Duration(milliseconds: 2000),
                        autoDismiss: true,
                      ).show(context);
                  return;
                }

                Loader.show(context,
                  isAppbarOverlay: true,
                  isBottomBarOverlay: true,
                  progressIndicator: const CircularProgressIndicator(
                    backgroundColor: Colors.black87,
                  ),
                  themeData: Theme.of(context)
                      .copyWith(accentColor: Colors.green),
                  overlayColor: const Color(0x99E8EAF6)
                );

                apiControllers.login(adminDetails).then(
                  (response){
                    if (response.statusCode == 200) {
                      Get.offNamed(Routes.home);
                      CherryToast.success(
                        toastDuration: const Duration(seconds: 2),
                        title: "",
                        enableIconAnimation: true,
                        displayTitle: false,
                        description: "Login Successful",
                        toastPosition: POSITION.BOTTOM,
                        animationDuration: const Duration(milliseconds: 2000),
                        autoDismiss: true,
                      ).show(context);
                    }else {
                      CherryToast.error(
                        toastDuration: const Duration(seconds: 2),
                        title: "",
                        enableIconAnimation: true,
                        displayTitle: false,
                        description: response.body,
                        toastPosition: POSITION.BOTTOM,
                        animationDuration: const Duration(milliseconds: 2000),
                        autoDismiss: true,
                      ).show(context);
                    }
                    Loader.hide();
                  }
                ).catchError((err) {
                  Loader.hide();
                }).onError((error, stackTrace) {
                  Loader.hide();
                  return null;
                });
                
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
