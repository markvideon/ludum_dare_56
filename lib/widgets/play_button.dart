import 'package:flutter/material.dart';

import '../pages/game.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const Game();
            },
          ),
        );
      },
      child: const Text('Play'),
    );
  }
}
