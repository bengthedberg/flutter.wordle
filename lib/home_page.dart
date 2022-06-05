import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordle'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(children: [
        Expanded(
            flex: 7,
            child: Container(
              color: Colors.grey,
            )),
        Expanded(
            flex: 4,
            child: Container(
              color: Colors.blueGrey,
            )),
      ]),
    );
  }
}
