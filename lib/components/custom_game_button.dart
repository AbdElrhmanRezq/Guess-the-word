import 'package:flutter/material.dart';

import '../consts.dart';

class CustomGameButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  late final Color mainColor;
  late final Color secondaryColor;
  CustomGameButton({required this.text, required this.function}) {
    if (text == "سهل") {
      mainColor = Colors.lightGreen;
      secondaryColor = Colors.green;
    } else if (text == "سهل جدا") {
      mainColor = Colors.lightBlue;
      secondaryColor = Colors.blue;
    } else if (text == "متوسط") {
      mainColor = Colors.orangeAccent;
      secondaryColor = Colors.orange;
    } else if (text == "صعب") {
      mainColor = Colors.redAccent;
      secondaryColor = Colors.red;
    } else {
      mainColor = Colors.grey;
      secondaryColor = Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.colorBurn,
            border: Border.all(color: secondaryColor, width: KBorderWidth),
            borderRadius: BorderRadius.circular(KBorderRadiusButton),
            color: mainColor,
          ),
          height: height * 0.21,
          width: width * 0.41,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 40),
          )),
        ),
      ),
    );
  }
}
