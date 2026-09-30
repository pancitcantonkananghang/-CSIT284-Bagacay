import 'dart:math';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final randomizer = Random();

  final List<Color> colors = [
    Colors.white,
    Colors.yellow,
    Colors.cyan,
    Colors.lightGreenAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
  ];

  int selectedColorIndex = 0;

  void handleStart() {
    setState(() {
      selectedColorIndex = randomizer.nextInt(colors.length);
    });
    widget.startQuiz();
  }

  @override
  Widget build(BuildContext context) {
    final currentColor = colors[selectedColorIndex];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 300,
        ),
        const SizedBox(height: 80),
        Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: currentColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: handleStart,
          style: OutlinedButton.styleFrom(
            foregroundColor: currentColor,
            side: BorderSide(color: currentColor),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
          ),
          icon: Icon(Icons.arrow_right_alt, color: currentColor),
          label: Text(
            'Start Quiz',
            style: TextStyle(
              color: currentColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}