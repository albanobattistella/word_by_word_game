import 'package:flutter_test/flutter_test.dart';
import 'package:word_by_word_game/models/ScoreModel.dart';

main() {
  const NEW_WORD = 'n E wW Or D';
  test('adding new word that increasing counter', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    // expect(scoreModel.counter, 1);
  });
  test('checking correct ending', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    expect(scoreModel.currentLetters, 'ord');
  });
  test('checking correct ReGisTRY and s p a c e', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    expect(scoreModel.lastWord, 'newword');
  });
  test('checking correct letters without right', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    expect(scoreModel.lastWordWithoutLetters, 'neww');
  });
  test('checking reset', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    scoreModel.resetParams();
    // expect(scoreModel.counter, 0);
    expect(scoreModel.lastWord, '');
    expect(await scoreModel.highscore, 1);
    expect(scoreModel.currentLettersIncreaseDecreaseCounter, 6);
  });
  test('decrease limit', () async {
    final scoreModel = ScoreModel();
    await scoreModel.add(NEW_WORD);
    scoreModel.decreaseLettersLimit();
    scoreModel.decreaseLettersLimit();
    scoreModel.decreaseLettersLimit();
    expect(scoreModel.lettersLimit, 1);
  });
}