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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    final player = AudioCache();
                    // player.setSource(AssetSource('coin.wav'));
                    print("Start");
                  }),
              SizedBox(width: 10),
              IconButton.filled(
                icon: const Icon(Icons.crop_square),
                onPressed: () {
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
