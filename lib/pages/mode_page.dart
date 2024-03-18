import 'package:flutter/material.dart';

import '../components/custom_game_button.dart';

class ModePage extends StatelessWidget {
  static const String id = "mode-page";

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
                    text: "صعب",
                    function: () {
                      Navigator.of(context)
                          .pushNamed("words-game", arguments: "3");
                    }),
                CustomGameButton(
                    text: "متوسط",
                    function: () {
                      Navigator.of(context)
                          .pushNamed("words-game", arguments: "4");
                    }),
                CustomGameButton(
                    text: "سهل",
                    function: () {
                      Navigator.of(context)
                          .pushNamed("words-game", arguments: "5");
                    }),
                CustomGameButton(
                    text: "سهل جدا",
                    function: () {
                      Navigator.of(context)
                          .pushNamed("words-game", arguments: "6");
                    }),
              ]),
        )));
  }
}
