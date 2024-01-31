import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int duration = 5;
  final CountDownController _controller = CountDownController();
  int comptador = 1;
  int cicle = 1;
  bool cicleFort = true;

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '$comptador/4 #',
                    style: TextStyle(fontSize: 50),
                  )),
              CircularCountDownTimer(
                // Countdown duration in Seconds.
                duration: duration,

                // Countdown initial elapsed Duration in Seconds.
                initialDuration: 0,

                // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                controller: _controller,

                // Width of the Countdown Widget.
                width: MediaQuery.of(context).size.width / 2,

                // Height of the Countdown Widget.
                height: MediaQuery.of(context).size.height / 2,

                // Ring Color for Countdown Widget.
                ringColor: Colors.grey[300]!,

                // Ring Gradient for Countdown Widget.
                ringGradient: null,

                // Filling Color for Countdown Widget.
                fillColor: Colors.purpleAccent[100]!,

                // Filling Gradient for Countdown Widget.
                fillGradient: null,

                // Background Color for Countdown Widget.
                backgroundColor: Colors.purple[500],

                // Background Gradient for Countdown Widget.
                backgroundGradient: null,

                // Border Thickness of the Countdown Ring.
                strokeWidth: 20.0,

                // Begin and end contours with a flat edge and no extension.
                strokeCap: StrokeCap.round,

                // Text Style for Countdown Text.
                textStyle: const TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),

                // Format for the Countdown Text.
                textFormat: CountdownTextFormat.S,

                // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                isReverse: true,

                // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                isReverseAnimation: false,

                // Handles visibility of the Countdown Text.
                isTimerTextShown: true,

                // Handles the timer start.
                autoStart: false,

                // This Callback will execute when the Countdown Starts.
                onStart: () {
                  // Here, do whatever you want
                  debugPrint('Countdown Started');
                  player.stop();
                  if (cicle % 2 != 0) {
                    player.play(AssetSource('fireball.mp3'));
                  } else {
                    player.play(AssetSource('naruto.mp3'));
                  }
                },

                // This Callback will execute when the Countdown Ends.
                onComplete: () {
                  // Here, do whatever you want
                  debugPrint('Countdown Ended');
                  if (comptador <= 4) {
                    print(comptador);
                    cicle++;
                    if (cicleFort) {
                      cicleFort = false;
                      comptador++;
                      _controller.restart(duration: 4);
                    } else {
                      cicleFort = true;
                      _controller.restart(duration: 5);
                    }
                  } else {
                    player.stop();
                  }
                },

                // This Callback will execute when the Countdown Changes.
                onChange: (String timeStamp) {
                  // Here, do whatever you want
                  debugPrint('Countdown Changed $timeStamp');
                },

                /* 
            * Function to format the text.
            * Allows you to format the current duration to any String.
            * It also provides the default function in case you want to format specific moments
              as in reverse when reaching '0' show 'GO', and for the rest of the instances follow 
              the default behavior.
          */
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  return Function.apply(defaultFormatterFunction, [duration]);
                },
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _controller.start();
                      // player.play(AssetSource('sound.mp3'));
                    },
                    tooltip: 'Start Countdown',
                    child: Icon(Icons.timer),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
