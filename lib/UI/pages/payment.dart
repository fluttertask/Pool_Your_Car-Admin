import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/UI/components/bottom_navigation.dart';
import 'package:adminapp/UI/components/custom_text_field.dart';
import 'package:adminapp/UI/components/payment_tile.dart';
import 'package:flutter/gestures.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:adminapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  ApiControllers apiController = Get.find();

  Future<void> getPayments() async {
    await apiController.getAllPayments();
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      print('refresh');
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    await getPayments();
    setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    getPayments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Payments History',
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
      body:  SizedBox(
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
                            apiController.searchPayments(text);
                          }
                        ),
                      ),
                            
                      const Divider(),
                            
                      SizedBox(
                        height: SizeConfig.of(context).screenHeight - 200,
                        child: SmartRefresher(
                          enablePullDown: true,
                          enablePullUp: true,
                          dragStartBehavior: DragStartBehavior.start,
                          header: const WaterDropHeader(),
                          controller: _refreshController,
                          onRefresh: _onRefresh,
                          onLoading: _onLoading,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Obx(() {
                              return Column(
                                children: List.generate(
                                  apiController.searchedPayments.length,
                                  (index){
                                    return PaymentTile(
                                      paymentModel: apiController.searchedPayments[index]
                                    );
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