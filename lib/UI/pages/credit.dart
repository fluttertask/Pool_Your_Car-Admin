import 'package:adminapp/Src/controllers/api_controllers.dart';
import 'package:adminapp/Src/models/user_model.dart';
import 'package:adminapp/UI/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({ Key? key, required this.user }) : super(key: key);

  final UserModel user;
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  
  ApiControllers apiController = Get.find();
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,

      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),

            SizedBox(
              child: Row(
                children: [
                  const Text(
                    'Name  : ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  const Expanded(child: SizedBox(),),

                  Text(
                    '${widget.user.firstname} ${widget.user.lastname}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              )
            ),

            const SizedBox(height: 20),

            SizedBox(
              child: Row(
                children: [
                  const Text(
                    'UniqueID  : ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                  const Expanded(child: SizedBox(),),

                  Text(
                    widget.user.phonenumber!.substring(1),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              )
            ),

            const SizedBox(height: 20),
            const Divider(),

            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: CustomTextField(
                textFormat: [FilteringTextInputFormatter.digitsOnly],
                hintText: const Text(
                  "Enter Ammount",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                  ),
                radius: 5,
                height: 50,
                backgroundColor: Colors.black87,
                icon: Icons.search,
                onText: (text){
                  amount = text;
                }
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(
              height: 45,
              width: 200,
              child: TextButton(
                onPressed:() {apiController.sendCredit(widget.user, int.parse(amount));},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: const Text(
                    'Send Credit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ),
          ]
        )
      )
    );
  }
}