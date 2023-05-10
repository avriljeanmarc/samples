// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../games_services/games_services.dart';
import '../settings/settings.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final gamesServicesController = context.watch<GamesServicesController?>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final sreenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: palette.backgroundMain,
        body: ResponsiveScreen(
          mainAreaProminence: 0.45,
          squarishMainArea: Center(
            child: Transform.rotate(
              angle: -0.0,
              child: Container(
                width: sreenWidth,
                height: 600.0,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Il',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Permanent Marker',
                            fontSize: 55,
                            height: 1,
                          ),
                        ),
                        const Text(
                          'est',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Permanent Marker',
                            fontSize: 55,
                            height: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '\u00E9crit!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Permanent Marker',
                                fontSize: 55,
                                height: 1,
                              ),
                            ),
                            Image.asset(
                              'assets/images/pencil.png',
                              width: 50.0,
                              height: 100.0,
                            ),
                          ],
                        )
                      ],
                    ),
                    /*Text(
                      'Il est \u00E9crit!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        fontSize: 55,
                        height: 1,
                      ),
                    ),
                    Positioned(
                      top: 30.0,
                      right: 10.0,
                      child: Image.asset(
                        'assets/images/pencil.png',
                        width: 50.0,
                        height: 100.0,
                      ),
                    ),*/
                  ],
                ),
              ),
              /*Stack(
                children: [
                  Positioned(
                    top: 20.0,
                    left: 20.0,
                    right: 10.0,
                    child: Image.asset(
                      'assets/images/pencil.png',
                      width: 50.0,
                      height: 100.0,
                    ),
                  ),
                  Text(
                    'Il est \u00E9crit!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize: 15,
                      height: 1,
                    ),
                  ),
                ],
              ),*/
            ),
          ),
          rectangularMenuArea: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  audioController.playSfx(SfxType.buttonTap);
                  GoRouter.of(context).go('/play');
                },
                child: const Text(
                  'Jouer',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    height: 1,
                  ),
                ),
              ),
              _gap,
              if (gamesServicesController != null) ...[
                _hideUntilReady(
                  ready: gamesServicesController.signedIn,
                  child: FilledButton(
                    onPressed: () => gamesServicesController.showAchievements(),
                    child: const Text(
                      'Achievements',
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                _gap,
                _hideUntilReady(
                  ready: gamesServicesController.signedIn,
                  child: FilledButton(
                    onPressed: () => gamesServicesController.showLeaderboard(),
                    child: const Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontFamily: 'Permanent Marker',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                _gap,
              ],
              FilledButton(
                onPressed: () => GoRouter.of(context).push('/settings'),
                child: const Text(
                  'Param\u00E8tres',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    height: 1,
                  ),
                ),
              ),
              _gap,
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ValueListenableBuilder<bool>(
                  valueListenable: settingsController.muted,
                  builder: (context, muted, child) {
                    return IconButton(
                      onPressed: () => settingsController.toggleMuted(),
                      icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
                    );
                  },
                ),
              ),
              _gap,
              /*const Text('Music by Mr Smith'),
            _gap,*/
            ],
          ),
        ),
      ),
    );
  }

  /// Prevents the game from showing game-services-related menu items
  /// until we're sure the player is signed in.
  ///
  /// This normally happens immediately after game start, so players will not
  /// see any flash. The exception is folks who decline to use Game Center
  /// or Google Play Game Services, or who haven't yet set it up.
  Widget _hideUntilReady({required Widget child, required Future<bool> ready}) {
    return FutureBuilder<bool>(
      future: ready,
      builder: (context, snapshot) {
        // Use Visibility here so that we have the space for the buttons
        // ready.
        return Visibility(
          visible: snapshot.data ?? false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: child,
        );
      },
    );
  }

  static const _gap = SizedBox(height: 10);
}
