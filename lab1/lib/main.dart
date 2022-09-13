import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

double size = 3;

double height = 600.0;
double width = 600.0;

int coordX = 0;

int countPoints = 600;
int fromPoints = -300;
Function function = (i) => i;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: height,
              ),
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  ...listPoint(function),
                ],
              ),
            ),
            rowCount(setState),
            rowPoint(setState),
            rowGraph(setState),
            rowMove(setState),
          ],
        ),
      ),
    );
  }
}

List listPoint(Function function) {
  final listDigits =
      List.generate(countPoints, (index) => fromPoints + index + 0.0);
  double min = function(listDigits[0]) + 0.0;
  double max = function(listDigits[0]) + 0.0;

  for (var element in listDigits) {
    if (function(element) < min) min = function(element);
    if (function(element) > max) max = function(element);
  }

  print('$max; $min');

  final result =
      List.generate(countPoints, (index) => fromPoints + index).map((e) {
    // print((((function(e) - min) * (height - 0)) / (max - min)) + 0);
    print(
        '$e: ${height - (((function(e) - min) * (height - 0)) / (max - min)) + 0}');
    return Positioned(
      left: coordX + width / 2 + e,
      top: height - (((function(e) - min) * (height - 0)) / (max - min)) + 0,
      child: Container(
        height: size,
        width: size,
        color: Colors.red,
      ),
    );
  }).toList();

  return result;
}

Widget rowMove(Function setState) {
  return Container(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            coordX -= 100;
            setState(() {});
          },
          child: const Text(
            'Left 100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            coordX += 100;
            setState(() {});
          },
          child: const Text(
            'Right 100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget rowGraph(Function setState) {
  return Container(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            function = (x) => x;
            setState(() {});
          },
          child: const Text(
            'x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => -x;
            setState(() {});
          },
          child: const Text(
            '-x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => -x * x;
            setState(() {});
          },
          child: const Text(
            '-x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => x * x;
            setState(() {});
          },
          child: const Text(
            'x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Text(
          'Now: 2 to ${function(2)}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => x * x * x;
            setState(() {});
          },
          child: const Text(
            'x*x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => -x * x * x;
            setState(() {});
          },
          child: const Text(
            '-x*x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => x * x * x * x;
            setState(() {});
          },
          child: const Text(
            'x*x*x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            function = (x) => -x * x * x * x;
            setState(() {});
          },
          child: const Text(
            '-x*x*x*x',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget rowPoint(Function setState) {
  return Container(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            fromPoints -= 100;
            setState(() {});
          },
          child: const Text(
            '-100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            fromPoints -= 10;
            setState(() {});
          },
          child: const Text(
            '-10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Text(
          'from points: ${fromPoints.toString()}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            fromPoints += 10;
            setState(() {});
          },
          child: const Text(
            '+10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            fromPoints += 100;
            setState(() {});
          },
          child: const Text(
            '+100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget rowCount(Function setState) {
  return Container(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            countPoints -= 100;
            if (countPoints < 2) countPoints = 2;
            setState(() {});
          },
          child: const Text(
            '-100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            countPoints -= 10;
            if (countPoints < 2) countPoints = 2;
            setState(() {});
          },
          child: const Text(
            '-10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Text(
          'count points: ${countPoints.toString()}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            countPoints += 10;
            setState(() {});
          },
          child: const Text(
            '+10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            countPoints += 100;
            setState(() {});
          },
          child: const Text(
            '+100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
