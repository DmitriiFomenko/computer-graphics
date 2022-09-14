import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

double size = 1;

double height = 600.0;
double width = 600.0;

int coordX = 0;
int coordY = 0;

int countPoints = 2000;
int fromPoints = -1000;
Function function = (i) => i * i;

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
            TextButton(
              onPressed: () {
                height = 600.0;
                width = 600.0;
                coordX = 0;
                coordY = 0;
                countPoints = 2000;
                fromPoints = -1000;
                setState(() {});
              },
              child: const Text(
                'RESET',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
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
    // print(
    //     '$e: ${height - (((function(e) - min) * (height - 0)) / (max - min)) + 0}');
    return Positioned(
      left: coordX +
          width / 2 +
          (((e - fromPoints) * (height - 0)) /
              (countPoints - fromPoints - fromPoints)) +
          0,
      top: coordY +
          height -
          (((function(e) - min) * (height - 0)) / (max - min)) +
          0,
      child: Container(
        height: countPoints < 200 ? size * 3 : size,
        width: countPoints < 200 ? size * 3 : size,
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
        Text(
          'X: $coordX; Y: $coordY',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            coordY -= 100;
            setState(() {});
          },
          child: const Text(
            'Up 100',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            coordY += 100;
            setState(() {});
          },
          child: const Text(
            'Down 100',
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
            fromPoints -= 1000;
            setState(() {});
          },
          child: const Text(
            '-1000',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
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
        TextButton(
          onPressed: () {
            fromPoints += 1000;
            setState(() {});
          },
          child: const Text(
            '+1000',
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
            countPoints -= 1000;
            if (countPoints < 2) countPoints = 2;
            setState(() {});
          },
          child: const Text(
            '-1000',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
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
        TextButton(
          onPressed: () {
            countPoints += 1000;
            setState(() {});
          },
          child: const Text(
            '+1000',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
