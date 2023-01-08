import 'package:flutter/material.dart';
import 'formulas.dart' as formulas;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HazBandeja APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sidec = 0;
  double angleA = 0;
  double angleB = 0;
  double wingTriangleA = 0;
  double wingTriangleB = 0;
  double baseTriangleA = 0;
  double baseTriangleB = 0;

  void _calculate() {
    setState(() {
      formulas.abC(double.parse(sidea.text), double.parse(sideb.text),
          double.parse(height.text), double.parse(width.text));
      sidec = formulas.sidec;
      angleA = formulas.angleA;
      angleB = formulas.angleB;
      wingTriangleA = formulas.wingTriangleA;
      wingTriangleB = formulas.wingTriangleB;
    });
  }

  TextEditingController sidea = TextEditingController();
  TextEditingController sideb = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController width = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Introduce los datos de la bandeja:',
            ),
            TextField(
              controller: sidea,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: sideb,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: height,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: width,
              keyboardType: TextInputType.number,
            ),
            Text('Desarrollo'),
            Text(
              sidec.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Ángulo A'),
            Text(
              angleA.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Ángulo B'),
            Text(
              angleB.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Triángulo sobre ala A'),
            Text(
              wingTriangleA.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('Triángulo sobre ala B'),
            Text(
              wingTriangleB.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('CALCULAR'),
            )
          ],
        ),
      ),
    );
  }
}
