import 'package:adminapp/UI/helpers/size_config.dart';
import 'package:flutter/material.dart';
   
class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationItem> buttons;

  const BottomNavigation({ Key? key, required this.buttons}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: List.generate(
          buttons.length,
          (index) => _BottomNavigationButton(
            icon: buttons[index].icon,
            text: buttons[index].text,
            index: index,
            onPressed: buttons[index].onPressed,
            color: buttons[index].color
          )
        )
      ),
    );
  }
}

class BottomNavigationItem {
  final String text;
  final Icon icon;
  final Color color;
  final Function onPressed;
  final int index;

  BottomNavigationItem({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.index,
  });
}


class _BottomNavigationButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  final Color color;
  final int index;
  final String text;
  const _BottomNavigationButton({ Key? key, required this.index, required this.onPressed, required this.color, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 55,
        width: SizeConfig.of(context).getScreenWidth(50),
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

