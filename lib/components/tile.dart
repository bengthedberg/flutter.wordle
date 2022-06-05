import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/controller.dart';

class Tile extends StatelessWidget {
  const Tile({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (_, notifier, __) {
      String text = "";
      if (index < notifier.tilesEntered.length) {
        // protect at start when list is 0
        text = notifier.tilesEntered[index].letter;
      } else {
        const SizedBox(); // return nothing
      }
      return Center(child: Text(text));
    });
  }
}
