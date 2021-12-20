import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
    
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  ApiControllers apiController = Get.find();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    await apiController.getDetails();
    setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
     apiController.getDetails();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          // dragStartBehavior: DragStartBehavior.start,
          header: const WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.of(context).getScreenHeight(4),),
              SizedBox(
                child: Row(
                  children: [
                    const Text(
                      'Email :',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        
                    const Expanded(child: SizedBox()),
        
                    Text(
                      apiController.currentUser.value.email??'',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              const Divider(),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              SizedBox(
                width: SizeConfig.of(context).screenWidth - 20,
                child: Row(
                  children: [
                    const Text(
                      'Created On :     ',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        
                    const Expanded(child: SizedBox()),
        
                    Text(
                      (apiController.currentUser.value.createdOn??'').split('+')[0],
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              const Divider(),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              SizedBox(
                width: SizeConfig.of(context).screenWidth - 20,
                child: Row(
                  children: [
                    const Text(
                      'Last Login :     ',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        
                    const Expanded(child: SizedBox()),
        
                    Text(
                      (apiController.currentUser.value.lastLogin??'').split('+')[0],
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              const Divider(),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
        
              SizedBox(
                child: Row(
                  children: const [
                    Text(
                      'Total Balance :',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
        
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(5),),
        
              SizedBox(
                child: Center(
                  child: Obx(() {
                      return Text(
                        'Rs. ${apiController.currentUser.value.totalAmount??0}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      );
                    }
                  ),
                ),
              ),
        
              SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
            ],
          ),
        ),
      ),
    );
  }
}