import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ludum_dare_56/widgets/masked_text.dart';
import 'package:ludum_dare_56/widgets/revealable_text.dart';

import '../model/critters.dart';
import '../widgets/rotator.dart';
import '../widgets/streaks.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isRevealed = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // TODO(Mark): Replace
    final activeCritter = Critter.values.first;
    final candidateCount = 3;

    final candidates = [
      activeCritter,
      // ... fill up to candidateCount
    ];

    final pool = [...Critter.values]
      ..shuffle();
    for (final critter in pool) {
      print('Critter: ${critter.label}');

      if (critter != activeCritter) {
        if (candidates.length < candidateCount) {
          candidates.add(critter);
        } else {
          break;
        }
      }
    }

    candidates.shuffle();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: ShaderMask(
              shaderCallback: (rect) {
                return const RadialGradient(
                  colors: [
                    Colors.white,
                    Colors.green,
                    Colors.white,
                    Colors.green,
                  ],
                  radius: 100.0
                ).createShader(rect);
              },
              child: const SizedBox.expand(),
            ),
          ),
          const Rotator(
            child: Streaks(),
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
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // TODO(Mark):
                                      if (critter == activeCritter) {
                                        setState(() {
                                          _isRevealed = true;
                                        });
                                      } else {
                                        setState(() {
                                          _isRevealed = false;
                                        });
                                      }
                                    },
                                    child: Text(critter.label),
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
          )
        ],
      ),
    );
  }
}
