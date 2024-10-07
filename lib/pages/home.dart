import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ludum_dare_56/widgets/masked_text.dart';

import '../model/critters.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: SizedBox.expand(),
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
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: MaskedText(
                          text: activeCritter.emojis.first,
                          style: const TextStyle(
                            fontSize: 128.0,
                          ),
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ...List.generate(
                    candidateCount,
                        (idx) {
                      return Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // TODO(Mark):
                            },
                            child: Text(candidates.elementAt(idx).label),
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      );
                    },
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
