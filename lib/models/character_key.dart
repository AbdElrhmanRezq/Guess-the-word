import 'package:flutter/material.dart';

class CharacterKey {
  String char;
  String condition = "undiscovered";
  Color color = Colors.grey[700] as Color;
  int pos = -1;
  CharacterKey(this.char);
  void changeCondition(String newCondition) {
    condition = newCondition;
    if (newCondition == "undiscovered") {
      color = Colors.grey[700] as Color;
    } else if (newCondition == "found") {
      color = Colors.green;
    } else if (newCondition == "wrong") {
      color = const Color.fromARGB(255, 59, 59, 59);
    } else {
      color = Colors.orange;
    }
  }

  void reset() {
    changeCondition("undiscovered");
  }
}
