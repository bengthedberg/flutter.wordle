import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/controller.dart';

class Tile extends StatefulWidget {
  const Tile({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  Color _backgroundColor = Colors.transparent;
  late AnswerStage _answerStage;

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (_, notifier, __) {
      String text = "";
      if (widget.index < notifier.tilesEntered.length) {
        // protect at start when list is 0
        text = notifier.tilesEntered[widget.index].letter;
        _answerStage = notifier.tilesEntered[widget.index].answerStage;
        if (_answerStage == AnswerStage.correct) {
          _backgroundColor = correctColor;
        } else if (_answerStage == AnswerStage.contains) {
          _backgroundColor = containColor;
        }
      } else {
        const SizedBox(); // return nothing
      }
      return Container(
        color: _backgroundColor,
        child: FittedBox(
          fit: BoxFit.contain, // Make the letter as large as possible
          child: Text(text),
        ),
      );
    });
  }
}
