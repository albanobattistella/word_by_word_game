import 'package:flutter_test/flutter_test.dart';
import 'package:word_by_word_game/models/ScoreModel.dart';

main() {
  const NEW_WORD = 'n E wW Or D';
  test('adding new word that increasing counter', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    expect(scoreModel.counter, 1);
  });
  test('checking correct ending', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    expect(scoreModel.currentLetters, 'ord');
  });
  test('checking correct ReGisTRY and s p a c e', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    expect(scoreModel.lastWord, 'newword');
  });
  test('checking correct letters without right', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    expect(scoreModel.lastWordWithoutLetters, 'neww');
  });
  test('checking reset', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    scoreModel.resetWordsCounterAndLastWord();
    expect(scoreModel.counter, 0);
    expect(scoreModel.lastWord, '');
    expect(scoreModel.highscore, 1);
  });
  test('increase limit', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    scoreModel.increaseLettersLimit();
    expect(scoreModel.lettersLimit, 4);
  });
  test('decrease limit', () {
    final scoreModel = ScoreModel();
    scoreModel.add(NEW_WORD);
    scoreModel.decreaseLettersLimit();
    scoreModel.decreaseLettersLimit();
    scoreModel.decreaseLettersLimit();
    expect(scoreModel.lettersLimit, 1);
  });
}