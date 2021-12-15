import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/UI/components/bottom_navigation.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiControllers apiController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Welcome to the Admin Panel',
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          verticalDirection: VerticalDirection.up,
          children: [
            SizedBox(
              child: BottomNavigation(
                buttons: [
                  BottomNavigationItem(
                    icon: const Icon(Icons.home, size: 28, color: Colors.white,),
                    color: Colors.blue, onPressed: (){},
                    index: 0,
                    text: 'Home'
                  ),
                  BottomNavigationItem(
                    icon: Icon(Icons.exit_to_app, size: 28, color: Theme.of(context).backgroundColor,),
                    color: Colors.white,
                    onPressed: (){
                       Get.offNamed(Routes.login);
                       apiController.logout();
                    },
                    index: 1,
                    text: 'Logout'
                  )
                ],
              ),
            ),
            Container(
              height: SizeConfig.of(context).screenHeight - 120,
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpecialBox(
                        icon: const Icon(Icons.person, size: 40),
                        text: "See all Users",
                        onPressed: (){
                          Get.toNamed(Routes.allUsers);
                        },
                      ),
                      SpecialBox(
                        icon: const Icon(Icons.person_off, size: 40),
                        text: "Blocked Users",
                        onPressed: (){
                          Get.toNamed(Routes.blockedUsers);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpecialBox(
                        icon: const Icon(Icons.account_tree_sharp, size: 40),
                        text: "Topup Balance",
                        onPressed: (){
                          Get.toNamed(Routes.creditUsers);
                        },
                      ),
                      SpecialBox(
                        icon: const Icon(Icons.account_tree_sharp, size: 40),
                        text: "Chat Users",
                        onPressed: (){
                          // Get.toNamed(Routes.creditUsers);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpecialBox(
                        icon: const Icon(Icons.account_tree_sharp, size: 40),
                        text: "Payment History",
                        onPressed: (){
                          Get.toNamed(Routes.payment);
                        },
                      ),
                      SpecialBox(
                        icon: const Icon(Icons.admin_panel_settings, size: 40),
                        text: "About Admin",
                        onPressed: (){
                          Get.toNamed(Routes.admin);
                        },
                      ),
                    ],
                  )
                ],
              )

            )
          ],)

      ),
    );
  }
}




// ignore: must_be_immutable
class SpecialBox extends StatelessWidget {
  SpecialBox({ Key? key, this.icon, this.text, this.onPressed}) : super(key: key);
  Icon? icon;
  String? text;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (onPressed != null) onPressed!();
      },
      child: Container(
        width: 135,
        height: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const 
          BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (text != null) Text(text!),
          ],
        ),
      ),
    );
  }
}