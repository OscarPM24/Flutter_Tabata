import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    // player.setSource(AssetSource('coin.wav'));
                    player.play(AssetSource('sound.mp3'));
                    print("Start");
                  }),
              SizedBox(width: 10),
              IconButton.filled(
                icon: const Icon(Icons.crop_square),
                onPressed: () {
                  player.pause();
                  print("Stop");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
