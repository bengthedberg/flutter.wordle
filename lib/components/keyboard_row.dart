import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/controller.dart';
import 'package:wordle/data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({required this.min, required this.max, Key? key})
      : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Grap the size of the device
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        int index = 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: keysMap.entries.map((e) {
            index++;
            if (index >= min && index <= max) {
              Color color = Theme.of(context).primaryColorLight;
              Color keyColor = Colors.white;
              if (e.value == AnswerStage.correct) {
                color = correctColor;
              } else if (e.value == AnswerStage.contains) {
                color = containColor;
              } else if (e.value == AnswerStage.incorrect) {
                color = Theme.of(context).primaryColorDark;
              } else {
                keyColor = Theme.of(context).textTheme.bodyText2?.color ??
                    Colors.black;
              }

              return Padding(
                padding: EdgeInsets.all(size.width * .006),
                child: ClipRRect(
                  // Round the keys
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    // Space out the keyboard
                    width: e.key.length > 1
                        ? size.width * 0.13
                        : size.width * 0.085,
                    height: size.height * 0.090,
                    child: Material(
                      // Inkwell must be wrapped in a Material Widget
                      color: color,
                      child: InkWell(
                        // Make a splach effect when tapping key
                        onTap: () {
                          Provider.of<Controller>(context, listen: false)
                              .setKeyTapped(value: e.key);
                        },
                        child: Center(
                            child: Text(
                          e.key,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: keyColor),
                        )),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }).toList(),
        );
      },
    );
  }
}
