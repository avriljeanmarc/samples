import 'package:flutter/material.dart';
import 'package:game_template/src/audio/sounds.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final audioController = context.watch<AudioController>();
    return Container(
      margin: EdgeInsets.all(3.0),
      height: 45.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color(0xFFFF8C3B),
            Color(0xFFFF6365),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: InkResponse(
        onTap: () => audioController.playSfx(SfxType.unlockGame), //onTap,
        splashColor: Colors.yellow,
        radius: 30.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Permanent Marker',
            ),
          ),
        ),
      ),
    );
    /*final audioController = context.read<AudioController>();
    late Widget wid;
    switch (choice) {
      case 0:
        wid = OutlinedButton(
          onPressed: onTap,
          child: Text(text),
        );
        break;
      case 1:
        wid = FilledButton(
          onPressed: onTap,
          child: Text(text),
        );
        break;

      case 2:
        wid = ElevatedButton(
          onPressed: onTap,
          child: Text(text),
        );
        break;
      case 3:
        wid = OutlinedButton(
          onPressed: onTap,
          child: Text(text),
        );
        break;
    }

    return wid;
    return GestureDetector(
        onTap: () => audioController.playSfx(SfxType.buttonTap),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/output.png',
              // width: 100.0,
              //height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 14.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),);*/
  }
}
