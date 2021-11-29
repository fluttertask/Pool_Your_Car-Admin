import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTile extends StatefulWidget {
  const CustomTile({ Key? key, required this.name, required this.number, required this.buttonText, required this.onPressedButton}) : super(key: key);

  // final String image;
  final String name;
  final String number;
  final String buttonText;
  final Function onPressedButton;

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: SizeConfig.of(context).getScreenWidth(90),
      margin: const EdgeInsets.only(bottom: 10, top: 3),
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
          ),
        ]
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage('assets/images/profileimage.png')
              ),
            ),
          ),

          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                widget.number,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          
          const Expanded(child: SizedBox()),

          SizedBox(
            height: 35,
            child: TextButton(
              onPressed:() {widget.onPressedButton();},
              style: TextButton.styleFrom(
                backgroundColor: Colors.black87
              ),
              child: Text(
                  widget.buttonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ),
          )
        ]
      ),
    );
  }
}