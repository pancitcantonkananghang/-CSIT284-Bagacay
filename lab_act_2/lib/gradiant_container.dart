import 'package:flutter/material.dart';
import 'package:lab_act_2/dice_roller.dart';


class GradientContainer extends StatelessWidget {
  GradientContainer({super.key});
  final List<Color> colors;

  @override
  
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 99, 108, 116),
            const Color.fromARGB(255, 27, 25, 24),
          ],
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
