import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }

}

class _DiceRollerState extends State<DiceRoller> {
 @override
 
  final randomizer = Random();
  var currentDiceRoll = 'assets/dice-images/dice-2.png';
  void rollDice() {
    setState(() {
      int num = randomizer.nextInt(6) + 1;
      currentDiceRoll = 'assets/dice-images/dice-$num.png';
    });
  }
 
 Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(width: 160, currentDiceRoll),
        SizedBox(height: 50,),
        TextButton(onPressed: rollDice,
          child: Text(
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 134, 134, 99),
            ),
            'Roll Dice')),
      ],
    );
  }
}
