import 'package:adminapp/Src/models/payment_model.dart';
import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
    
class PaymentTile extends StatelessWidget {

  const PaymentTile({ Key? key, required this.paymentModel }) : super(key: key);

  final PaymentModel paymentModel;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 7.0),
            child: SizedBox(
              child: Text(
                "From",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            child: Row(
              children: [
                const Text(
                  'Name :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  paymentModel.fromName??'',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),

          SizedBox(
            child: Row(
              children: [
                const Text(
                  'ID :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  paymentModel.from??'',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 7.0),
            child: SizedBox(
              child: Text(
                "Receiver",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),
          SizedBox(
            child: Row(
              children: [
                const Text(
                  'Name :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  paymentModel.toName??'',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),

          SizedBox(
            child: Row(
              children: [
                const Text(
                  'ID :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  paymentModel.to??'',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          const Divider(),

          SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),

          SizedBox(
            child: Row(
              children: [
                const Text(
                  'Amount :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  '${paymentModel.amount??""}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: SizeConfig.of(context).getScreenHeight(2),),

          SizedBox(
            child: Row(
              children: [
                const Text(
                  'Date :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Expanded(child: SizedBox()),

                Text(
                  paymentModel.date??"",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),

          const Divider(),
        ]
      ),
    );
  }
}