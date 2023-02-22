import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dice(),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int _diceCount1 = 1;
  int _diceCount2 = 1;

  void generateNumber() {
    Random random1 = Random();
    Random random2 = Random();
    setState(() {
      _diceCount1 = random1.nextInt(6) + 1;
      _diceCount2 = random2.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      appBar: AppBar(
        title: const Text(
          "Task 5",
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Wrap(
          spacing: 25.0,
          runSpacing: 25.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            SizedBox(
              width: 145,
              height: 145,
              child: Image(
                image: AssetImage("assets/dice$_diceCount1.png"),
              ),
            ),
            SizedBox(
              width: 145,
              height: 145,
              child: Image(
                image: AssetImage("assets/dice$_diceCount2.png"),
              ),
            ),
            ElevatedButton(
              onPressed: generateNumber,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(150.0, 35.0),
              ),
              child: const Text(
                "Generate",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
