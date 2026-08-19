import 'package:flutter/material.dart';
import 'styled_text.dart';



class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color.fromARGB(255, 99, 108, 116), const Color.fromARGB(255, 27, 25, 24)],
        ),
      ),
      child: Center(
        child: StyledText('Orgie Bagacay')
      ),
    );
  }
}
