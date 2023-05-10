import 'package:flutter/material.dart';
import 'package:game_template/src/style/answer_button.dart';
import 'package:game_template/src/style/chrono.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';

class LevelOne extends StatelessWidget {
  const LevelOne({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.7 * screenHeight,
          child: Image.asset(
            'assets/images/sky1.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          child: Row(
            children: const [
              Chrono(
                laps: 5,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: SizedBox(
            width: 35.0,
            child: Column(
              children: [
                IconButton(
                  onPressed: () => GoRouter.of(context).push('/settings'),
                  icon: Icon(
                    Icons.settings,
                    semanticLabel: 'Settings',
                  ),
                ),
                IconButton(
                  onPressed: () => GoRouter.of(context).go('/play'),
                  icon: Icon(
                    Icons.exit_to_app,
                    semanticLabel: 'Quit',
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0.05 * screenHeight,
          right: 25.0,
          bottom: 0.6 * screenHeight,
          child: Transform.rotate(
            angle: -0.2,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/callout5.png',
                  width: 0.9 * screenWidth,
                  height: 0.3 * screenHeight,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 50.0,
                  left: 60.0,
                  right: 60.0,
                  bottom: 60.0,
                  child: Text(
                    'Nom de la mere de Moise?',
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0.4 * screenHeight,
          left: 50.0,
          child: Visibility(
            visible: true,
            child: Image.asset(
              'assets/images/balloon1.png',
              width: 100.0,
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          right: 10.0,
          bottom: 5.0,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AnswerButton(
                      onTap: () {},
                      text: 'Adam',
                    ),
                  ),
                  Expanded(
                    child: AnswerButton(
                      onTap: () {},
                      text: 'Pierre',
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AnswerButton(
                      onTap: () {},
                      text: 'Paul',
                    ),
                  ),
                  Expanded(
                    child: AnswerButton(
                      onTap: () {},
                      text: 'Jesus',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        //Consumer<ChronoModel>(builder: (context, chronoModel, child) {}),
      ],
    );
  }
}
