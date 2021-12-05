import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/UI/components/bottom_navigation.dart';
import 'package:adminapp/UI/components/custom_text_field.dart';
import 'package:adminapp/UI/components/custom_tile.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class BlockedUsersPage extends StatefulWidget {
  const BlockedUsersPage({Key? key}) : super(key: key);

  @override
  _BlockedUsersPageState createState() => _BlockedUsersPageState();
}

class _BlockedUsersPageState extends State<BlockedUsersPage> {
  ApiControllers apiController = Get.find();

  Future<void> refresh() async {
    await apiController.getUser();
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'List of all Blocked Users',
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            SizedBox(
              child: BottomNavigation(
                buttons: [
                  BottomNavigationItem(
                    icon: const Icon(Icons.home, size: 28, color: Colors.white,),
                    color: Colors.blue, onPressed: (){
                      Get.offAllNamed(Routes.home);
                    },
                    index: 0,
                    text: 'Home'
                  ),
                  BottomNavigationItem(
                    icon: Icon(Icons.exit_to_app, size: 28, color: Theme.of(context).backgroundColor,),
                    color: Colors.white,
                    onPressed: (){
                      Get.offAllNamed(Routes.login);
                      apiController.logout();
                    },
                    index: 1,
                    text: 'Logout'
                  )
                ],
              ),
            ),
            SizedBox(
              child: Container(
              height: SizeConfig.of(context).screenHeight - 120,
                padding: const EdgeInsets.only(left: 5, top: 0, right: 5),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: CustomTextField(
                        radius: 5,
                        height: 50,
                        backgroundColor: Colors.black87,
                        icon: Icons.search,
                        onText: (text){
                          apiController.searchUsers(text);
                        }
                      ),
                    ),

                    const Divider(),

                    SizedBox(
                      height: SizeConfig.of(context).screenHeight - 200,
                      child: RefreshIndicator(
                        onRefresh: () async{
                          await refresh();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Obx(() {
                            return Column(
                              children: List.generate(
                                apiController.searchedUsers.length,
                                (index){
                                  if (apiController.searchedUsers[index].blocked == null || apiController.searchedUsers[index].blocked == 'unblocked') {
                                    return const SizedBox();
                                  }else{
                                    return CustomTile(
                                      name: '${apiController.searchedUsers[index].firstname} ${apiController.searchedUsers[index].lastname}',
                                      number: apiController.searchedUsers[index].phonenumber!,
                                      buttonText: "Unblock",
                                      onPressedButton: () {
                                        apiController.unBlockUser(apiController.searchedUsers[index]);
                                        refresh();
                                      }
                                    );
                                  }
                                }),
                            );
                          })
                        ),
                      ),
                    )
                  ],
                )

              ),
            )
          ],)

      ),
    );
  }
}