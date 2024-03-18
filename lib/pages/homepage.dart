import 'package:flutter/material.dart';
import 'package:many_games/components/custom_game_button.dart';

import '../consts.dart';

class Homepage extends StatelessWidget {
  static const String id = "homepage";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: height * 0.1),
        child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              CustomGameButton(
                  text: "الكلمات",
                  function: () {
                    Navigator.of(context).pushNamed("mode-page");
                  }),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey, width: KBorderWidth),
                        borderRadius:
                            BorderRadius.circular(KBorderRadiusButton)),
                    height: height * 0.21,
                    width: width * 0.41,
                    child: const Center(
                        child: Text("Coming soon!",
                            style: TextStyle(
                                fontFamily: 'CustomFont', fontSize: 40)))),
              )
            ]),
      )),
    );
  }
}
