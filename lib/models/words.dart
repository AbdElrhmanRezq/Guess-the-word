import 'package:flutter/material.dart';

import 'character_key.dart';

class Words extends ChangeNotifier {
  late int wordLength;
  int counter = 0;
  List<List<CharacterKey>> words = [[], [], [], [], []];

  List<CharacterKey> arabicCharacters = [
    CharacterKey('ض'),
    CharacterKey('ص'),
    CharacterKey('ث'),
    CharacterKey('ق'),
    CharacterKey('ف'),
    CharacterKey('غ'),
    CharacterKey('ع'),
    CharacterKey('ه'),
    CharacterKey('خ'),
    CharacterKey('ح'),
    CharacterKey('ج'),
    CharacterKey('ش'),
    CharacterKey('س'),
    CharacterKey('ي'),
    CharacterKey('ب'),
    CharacterKey('ل'),
    CharacterKey('ا'),
    CharacterKey('ت'),
    CharacterKey('ن'),
    CharacterKey('م'),
    CharacterKey('ك'),
    CharacterKey('ط'),
    CharacterKey('ذ'),
    CharacterKey('ء'),
    CharacterKey('ؤ'),
    CharacterKey('ر'),
    CharacterKey('ى'),
    CharacterKey('ة'),
    CharacterKey('و'),
    CharacterKey('ز'),
    CharacterKey('ظ'),
    CharacterKey('د'),
    CharacterKey('x')
  ];

  void addChar(String char) {
    if (char == 'x')
      deleteChar();
    else if (words[counter].length == wordLength) {
    } else {
      words[counter].add(CharacterKey(char));
      notifyListeners();
    }
  }

  void deleteChar() {
    if (!words[counter].isEmpty) {
      words[counter].removeLast();
    }

    notifyListeners();
  }

  void setWordLength(int length) {
    wordLength = length;
  }

  void reset() {
    words = [[], [], [], [], []];
    counter = 0;
    arabicCharacters.forEach((char) {
      char.reset();
    });
    notifyListeners();
  }
}
