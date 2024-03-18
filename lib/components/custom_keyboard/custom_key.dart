import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/character_key.dart';
import '../../models/words.dart';

class CustomKey extends StatefulWidget {
  final CharacterKey charKey;
  const CustomKey(this.charKey);

  @override
  State<CustomKey> createState() => _CustomKeyState();
}

class _CustomKeyState extends State<CustomKey> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: SizedBox(
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            Provider.of<Words>(context, listen: false)
                .addChar(widget.charKey.char);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.charKey.color,
          ),
          child: widget.charKey.char != 'x'
              ? Text(widget.charKey.char)
              : Icon(
                  Icons.backspace,
                  size: height * 0.025,
                ),
        ),
      ),
    );
  }
}
