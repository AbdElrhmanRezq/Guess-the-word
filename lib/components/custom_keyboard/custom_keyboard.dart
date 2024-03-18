import 'package:flutter/material.dart';
import 'package:many_games/components/custom_keyboard/custom_key.dart';
import 'package:provider/provider.dart';
import '../../models/character_key.dart';
import '../../models/words.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CharacterKey> arabicCharacters =
        Provider.of<Words>(context).arabicCharacters;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                crossAxisCount: 11, // Adjust the number of columns as needed
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return CustomKey(arabicCharacters[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                crossAxisCount: 11, // Adjust the number of columns as needed
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return CustomKey(arabicCharacters[11 + index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                crossAxisCount: 11, // Adjust the number of columns as needed
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return CustomKey(arabicCharacters[22 + index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
