import 'package:flutter/material.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/models/tile_model.dart';

class Controller extends ChangeNotifier {
  int currentTile = 0;
  int currentRow = 0;
  String correctWord = "";
  List<TileModel> tilesEntered = [];

  setCorrectWord({required String word}) => correctWord = word;

  setKeyTapped({required String value}) {
    if (value == 'ENTER') {
      if (currentTile == 5 * (currentRow + 1)) {
        checkWord();
      }
    } else if (value == 'BACK') {
      if (currentTile > 5 * (currentRow + 1) - 5) {
        tilesEntered.removeLast();
        currentTile--;
      }
    } else {
      if (currentTile < 5 * (currentRow + 1)) {
        tilesEntered.add(
            TileModel(letter: value, answerStage: AnswerStage.notAnswered));
        currentTile++;
      }
    }
    notifyListeners();
  }

  checkWord() {
    List<String> guessed = [], remainingCorrect = [];

    for (int i = currentRow * 5; i < (currentRow * 5) + 5; i++) {
      guessed.add(tilesEntered[i].letter);
    }

    String guessedWord = guessed.join();
    remainingCorrect = correctWord.characters.toList();

    if (guessedWord == correctWord) {
      for (int i = currentRow * 5; i < (currentRow * 5) + 5; i++) {
        tilesEntered[i].answerStage = AnswerStage.correct;
      }
    } else {
      for (int i = 0; i < 5; i++) {
        if (guessedWord[i] == correctWord[i]) {
          remainingCorrect.remove(guessedWord[i]);
          tilesEntered[i + (currentRow * 5)].answerStage = AnswerStage.correct;
        }
      }
      for (int i = 0; i < remainingCorrect.length; i++) {
        for (int j = 0; j < 5; j++) {
          if (remainingCorrect[i] ==
              tilesEntered[j + (currentRow * 5)].letter) {
            if (tilesEntered[j + (currentRow * 5)].answerStage !=
                AnswerStage.correct) {
              tilesEntered[j + (currentRow * 5)].answerStage =
                  AnswerStage.contains;
            }
          }
        }
      }

      currentRow++;
      notifyListeners();
    }
  }
}
