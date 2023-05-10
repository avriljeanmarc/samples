import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final VoidCallback onCelebrate;
  final int gameLevel;
  const Game({super.key, required this.onCelebrate, required this.gameLevel});

  @override
  Widget build(BuildContext context) {
    return (FilledButton(
      onPressed: onCelebrate,
      child: Text('Start celebration $gameLevel'),
    ));
  }
}
