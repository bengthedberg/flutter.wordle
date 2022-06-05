import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Don't scroll
        padding: const EdgeInsets.fromLTRB(36, 20, 36, 20),
        itemCount: 30, // 5 columns by 6 rows
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, crossAxisSpacing: 4, mainAxisSpacing: 4),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Text(index.toString()),
            ),
          );
        });
  }
}
