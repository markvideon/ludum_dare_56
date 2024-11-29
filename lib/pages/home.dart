import 'package:flutter/material.dart';
import 'package:ludum_dare_56/pages/game.dart';

import '../model/critters.dart';
import '../widgets/play_button.dart';
import '../widgets/revealable_text.dart';
import '../widgets/rotator.dart';
import '../widgets/streaks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    final randomisedCritters = [
      ...Critter.values
    ]..shuffle();

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: SizedBox.expand(),
          ),
          const Rotator(
            child: Streaks(
              colors: [
                Colors.green,
                Colors.white,
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          blurRadius: 20.0
                        ),
                      ]
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: -10,
                                      right: 70,
                                      child: Text(
                                        randomisedCritters[1].emojis.first,
                                        style: textTheme.headlineSmall,
                                      ),
                                    ),
                                    Positioned(
                                      top: -20,
                                      left: 50,
                                      child: Text(
                                        randomisedCritters[2].emojis.first,
                                        style: textTheme.headlineMedium,
                                      ),
                                    ),
                                    Text(
                                      randomisedCritters[0].emojis.first,
                                      style: textTheme.headlineLarge,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    'Guess That Critter!',
                                    style: textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            Text(
                              'By Mark Videon',
                              style: textTheme.displaySmall,
                            ),
                          ],
                        )
                      )
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: PlayButton(),
          ),
        ],
      ),
    );
  }
}
