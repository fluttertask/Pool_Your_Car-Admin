import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
   
class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.icon,
    required this.onText,
    this.radius,
    this.height,
    this.backgroundColor,
    this.hintText,
    this.textFormat,
  }) : super(key: key);

  final IconData icon;
  final Function onText;
  double? radius;
  double? height;
  Color? backgroundColor;
  Widget? hintText;
  List<TextInputFormatter>? textFormat;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: SizeConfig.of(context).getScreenWidth(80),
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.of(context).getScreenHeight(height == null? 2: 0),
        horizontal: SizeConfig.of(context).getScreenWidth(10),
      ),
      decoration: BoxDecoration(
        color: backgroundColor??Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(radius??20)),
      ),
      child: TextFormField(
        inputFormatters: textFormat,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            size: 30,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 5,
            ),borderRadius: BorderRadius.all(Radius.circular(radius??20)),
          )
        ),
        onChanged: (text){
          onText(text);
        }
      )
    );
  }
}
