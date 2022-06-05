import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/components/grid.dart';
import 'package:wordle/components/keyboard_row.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/pages/settings_page.dart';
import 'package:wordle/providers/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final r = Random().nextInt(words.length);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setCorrectWord(word: words[r]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(children: [
        const Divider(
          height: 1,
          thickness: 2,
        ),
        const Expanded(
          flex: 7,
          child: Grid(),
        ),
        Expanded(
            flex: 4,
            child: Column(children: const [
              KeyboardRow(min: 1, max: 10),
              KeyboardRow(min: 11, max: 19),
              KeyboardRow(min: 20, max: 29),
            ])),
      ]),
    );
  }
}
