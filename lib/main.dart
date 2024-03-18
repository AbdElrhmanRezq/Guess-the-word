import 'package:flutter/material.dart';
import 'package:many_games/models/words.dart';
import 'package:many_games/pages/homepage.dart';
import 'package:many_games/pages/mode_page.dart';
import 'package:many_games/pages/words_game.dart';
import 'package:many_games/themes/dark_theme.dart';
import 'package:many_games/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Words>(
        create: (context) => Words(),
        child: MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: Homepage.id,
            routes: {
              Homepage.id: (context) => Homepage(),
              WordsGame.id: (context) => WordsGame(),
              ModePage.id: (context) => ModePage()
            }));
  }
}
