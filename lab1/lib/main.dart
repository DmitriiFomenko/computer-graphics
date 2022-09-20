import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const double height = 500.0;
const double width = 500.0;

double Function(double) function = (x) => sin(x);

int from = -10;
int length = 20;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MainPage(),
      },
      initialRoute: '/',
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              color: Colors.white,
            ),
            height: height,
            width: width,
            child: InteractiveViewer(
              panEnabled: true,
              child: CustomPaint(
                foregroundPainter: SinPainter(
                  function: function,
                  range: List.generate(
                      length.toInt() * 10, (index) => from + index * 0.1),
                ),
              ),
            ),
          ),
          rowGraph(setState),
          rowPoint(setState),
          rowCount(setState),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SinPainter extends CustomPainter {
  final double Function(double) function;
  final List<double> range;

  SinPainter({
    required this.function,
    required this.range,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final List<double> sums = range.map((e) => function(e)).toList();
    final List<double> convertedSums = sums
        .map((e) =>
            ((e - sums.reduce(min)) * height) /
            (sums.reduce(max) - sums.reduce(min)))
        .toList();

    final List<double> convertedRange = range
        .map((e) =>
            ((e - range.reduce(min)) * width) /
            (range.reduce(max) - range.reduce(min)))
        .toList();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    paint.strokeWidth = 2;
    var pt = Offset(0, height - convertedSums.first);

    for (int i = 0; i < sums.length; i += 1) {
      final npt = Offset(convertedRange[i], height - convertedSums[i]);
      canvas.drawLine(pt, npt, paint);
      pt = npt;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

Widget rowGraph(Function setState) {
  return Container(
    color: Colors.yellow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            function = (x) => x.abs();
            setState(() {});
          },
          child: const Text(
            '|x|',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
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
          'Now Y: ${function(from.toDouble())} to ${function(from + length + 0.0)}; Now X: $from to ${from + length};',
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
        TextButton(
          onPressed: () {
            function = (x) => sin(x);
            setState(() {});
          },
          child: const Text(
            'sin(x)',
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
            from -= 100;
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
            from -= 10;
            setState(() {});
          },
          child: const Text(
            '-10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            from -= 1;
            setState(() {});
          },
          child: const Text(
            '-1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Text(
          'from: ${from.toString()}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            from += 1;
            setState(() {});
          },
          child: const Text(
            '+1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            from += 10;
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
            from += 100;
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
            length -= 100;
            if (length < 2) length = 2;
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
            length -= 10;
            if (length < 2) length = 2;
            setState(() {});
          },
          child: const Text(
            '-10',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            length -= 1;
            if (length < 2) length = 2;
            setState(() {});
          },
          child: const Text(
            '-1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Text(
          'length: ${length.toString()}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            length += 1;
            setState(() {});
          },
          child: const Text(
            '+1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            length += 10;
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
            length += 100;
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
