import 'dart:math';

import 'package:flutter/material.dart';
import 'package:many_games/components/custom_keyboard/custom_key.dart';
import 'package:provider/provider.dart';

import '../components/custom_keyboard/custom_keyboard.dart';
import '../consts.dart';
import '../models/character_key.dart';
import '../models/words.dart';
import '../models/words_list.dart';

class WordsGame extends StatefulWidget {
  static const String id = "words-game";
  late String randomWord;
  Random random = Random();
  int? randomNum;
  List<String> words = [];
  int counter = 0;

  @override
  State<WordsGame> createState() => _WordsGameState();
}

class _WordsGameState extends State<WordsGame> {
  void initState() {
    super.initState();
    widget.randomNum = widget.random.nextInt(30);
  }

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////
    ////////////////////////////////////////
    //Variables
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String wordSize = ModalRoute.of(context)!.settings.arguments as String;
    WordsList wordsObj = WordsList();
    List<String> wordsList = wordsObj.map[wordSize] as List<String>;
    widget.randomWord = wordsList[widget.randomNum ?? 0];
    Provider.of<Words>(context).setWordLength(widget.randomWord.length);
    List<List<CharacterKey>> words = Provider.of<Words>(context).words;
    int counter = Provider.of<Words>(context).counter;
    List<CharacterKey> arabicCharacters =
        Provider.of<Words>(context).arabicCharacters;

    ////////////////////////////////////////
    ////////////////////////////////////////
    //Functions

    void endGameWindow(String condition) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.background,
                icon: Icon(
                    condition == "خسرت" ? Icons.thumb_down : Icons.thumb_up),
                title: Text(
                  "لقد ${condition}!",
                  style: const TextStyle(fontSize: 50),
                  textAlign: TextAlign.right,
                ),
                content: Text(
                  condition == "خسرت"
                      ? "الكلمة كانت: ${widget.randomWord} , اعادة المحاولة؟"
                      : "هل تريد اللعب مرة اخري؟",
                  textAlign: TextAlign.right,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Provider.of<Words>(context, listen: false).reset();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "لا",
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Provider.of<Words>(context, listen: false).reset();
                        widget.randomNum = widget.random.nextInt(30);
                        setState(() {});
                      },
                      child: const Text("نعم",
                          style: TextStyle(color: Colors.black)))
                ],
              ));
    }

    void check() {
      String word = "";

      //Get word from characters
      words[counter].forEach((element) {
        word += element.char;
      });

      //Check word correctness
      if (word == widget.randomWord) {
        endGameWindow("ربحت");
      } else if (word != widget.randomWord && counter == 4) {
        endGameWindow("خسرت");
      } else {
        for (int i = 0; i < widget.randomWord.length; i++) {
          CharacterKey char = arabicCharacters
              .firstWhere((char) => char.char == words[counter][i].char);
          CharacterKey charInWords = words[counter][i];
          if (widget.randomWord.contains(charInWords.char)) {
            if (i == widget.randomWord.indexOf(charInWords.char)) {
              char.changeCondition("found");
              charInWords.changeCondition("found");
            } else {
              char.changeCondition("misplaced");
              charInWords.changeCondition("misplaced");
            }
            charInWords.pos = widget.randomWord.indexOf(char.char);
          } else {
            char.changeCondition("wrong");
            charInWords.changeCondition("wrong");
          }
        }
        setState(() {
          Provider.of<Words>(context, listen: false).counter++;
        });
      }
    }

    return WillPopScope(
      onWillPop: () async {
        Provider.of<Words>(context, listen: false).reset();
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.5,
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, rowIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: SizedBox(
                          height: height * 0.18 * 0.5,
                          width: width,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.randomWord.length,
                              reverse: true,
                              itemBuilder: (context, charIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      width: width * 0.1,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: (charIndex >
                                                words[rowIndex].length - 1)
                                            ? Colors.grey[700] as Color
                                            : words[rowIndex][charIndex].color,
                                        borderRadius: BorderRadius.circular(
                                            KBorderRadius),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (charIndex >
                                              words[rowIndex].length - 1) {
                                            return const Text(" ");
                                          } else {
                                            return Text(
                                              words[rowIndex][charIndex].char,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomKeyboard(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width * 0.3,
                    height: height * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (words[counter].length == widget.randomWord.length) {
                          check();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("تحقق"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
