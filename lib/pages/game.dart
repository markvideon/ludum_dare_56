import 'package:flutter/material.dart';
import 'package:ludum_dare_56/widgets/revealable_text.dart';

import '../model/critters.dart';
import '../widgets/play_button.dart';
import '../widgets/rotator.dart';
import '../widgets/streaks.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool _isRevealed = false;
  late Critter activeCritter;
  late List<Critter> candidates;

  static const candidateCount = 3;

  @override
  void initState() {
    super.initState();

    final pool = [...Critter.values]
      ..shuffle();

    activeCritter = pool.first;

    candidates = [
      activeCritter,
      // to be added
    ];

    for (final critter in pool) {
      if (critter != activeCritter) {
        if (candidates.length < candidateCount) {
          candidates.add(critter);
        } else {
          break;
        }
      }
    }

    candidates.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: SizedBox.expand(),
          ),
          Rotator(
            child: Streaks(
              colors: _isRevealed ? [
                Colors.pink,
                Colors.green,
                Colors.yellow,
                Colors.green,
                Colors.purple,
                Colors.green,
                Colors.blue,
                Colors.green,
              ] : [
                Colors.green,
                Colors.white,
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.6),
                          blurRadius: 20.0
                        )
                      ]
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: RevealableText(
                          isRevealed: _isRevealed,
                          text: activeCritter.emojis.first,
                          style: const TextStyle(
                            fontSize: 128.0,
                          ),
                        )
                      )
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  if (_isRevealed) ...[
                    const PlayButton(),
                    const SizedBox(height: 24.0),
                  ],
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48.0,
                        vertical: 8,
                      ),
                      child: Column(
                        children: List.generate(
                          candidateCount,
                              (idx) {
                            final critter = candidates.elementAt(idx);

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: _isRevealed ? null : () {
                                      setState(() {
                                        _isRevealed = true;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(critter.label),
                                        if (_isRevealed) ...[
                                          if (critter == activeCritter)
                                            const SizedBox(width: 24),
                                          if (critter == activeCritter)
                                            const Icon(Icons.check)
                                          else
                                            const Icon(Icons.close),
                                        ]
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
