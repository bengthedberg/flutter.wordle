import 'package:flutter/material.dart';
import 'package:wordle/data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({required this.min, required this.max, Key? key})
      : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Grap the size of the device
    int index = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keysMap.entries.map((e) {
        index++;
        if (index >= min && index <= max) {
          return Padding(
            padding: EdgeInsets.all(size.width * .006),
            child: ClipRRect(
              // Round the keys
              borderRadius: BorderRadius.circular(6),
              child: Container(
                // Space out the keyboard
                color: Colors.white60,
                width:
                    e.key.length > 1 ? size.width * 0.13 : size.width * 0.085,
                height: size.height * 0.090,
                child: Material(
                  // Inkwell must be wrapped in a Material Widget
                  child: InkWell(
                    // Make a splach effect when tapping key
                    onTap: () {},
                    child: Center(child: Text(e.key)),
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
  }
}
