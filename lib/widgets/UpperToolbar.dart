import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:word_by_word_game/models/ScoreModel.dart';
import 'package:word_by_word_game/widgets/MenuWidget.dart';

class UpperToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScoreModel globalScoreModel = Provider.of<ScoreModel>(
      context,
    );

    return Material(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // TODO: add translation
                Text('words count'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Consumer<ScoreModel>(
                  builder: (context, value, child) =>
                      // TODO: add translation
                      Text('current: ${value.counter}'),
                ),
                Row(
                  children: [
                    // TODO: add translation
                    Text('highscore: '),

                    Consumer<ScoreModel>(
                        builder: (context, value, child) =>
                            Text('${value.highscore}')),
                    FutureBuilder(
                        future: globalScoreModel.loadHighscoreToStorage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
                          return Text('');
                        }),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer<ScoreModel>(
                  builder: (context, value, child) =>
                      // TODO: add translation
                      Text(
                          'letters to remove: ${value.currentLettersIncreaseDecreaseCounter}'),
                ),
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => _openBottomSheet(context),
                iconSize: 36,
                icon: Icon(Icons.menu),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (BuildContext buildContext) {
          return FractionallySizedBox(heightFactor: 1, child: MenuWidget());
        });
  }
}
