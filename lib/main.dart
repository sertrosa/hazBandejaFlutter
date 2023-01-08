import 'package:flutter/material.dart';
import 'formulas.dart' as formulas;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HazBandeja APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  


  void _incrementCounter() {
    
    setState(() {
      formulas.abC(double.parse(sidea.text), double.parse(sideb.text), double.parse(height.text), double.parse(width.text));
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
            Text(
              'Desarrollo'
            ),
            Text(
              sidec.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Ángulo A'
            ),
            Text(
              angleA.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Ángulo B'
            ),
            Text(
              angleB.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Triángulo sobre ala A'
            ),
            Text(
              wingTriangleA.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Triángulo sobre ala B'
            ),
            Text(
              wingTriangleB.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: _incrementCounter,child: Text('CALCULAR'),)
          ],
        ),
      ),
    );
  }
}
