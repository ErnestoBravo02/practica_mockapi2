import 'package:flutter/material.dart';
import 'package:practica_mockapi/services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final MockApi _mockApi = MockApi();
  String resultgreen = '';
  String resultorange = '';
  String resultred = '';

  double containerWidthgreen = 0.0;
  double containerWidthorange = 0.0;
  double containerWidthred = 0.0;

  Duration animationDuration1 = Duration(seconds: 1);
  Duration animationDuration2 = Duration(seconds: 3);
  Duration animationDuration3 = Duration(seconds: 10);

  void onPressedGreen() async {
    setState(() {
      containerWidthgreen = 100.0; 
    });

    final result = await _mockApi.getFerrariInteger();
    
    setState(() {
      containerWidthgreen = 0.0;
      resultgreen = '$result';
    });
  }

  void onPressedOrange() async {
    setState(() {
      containerWidthorange = 100.0; 
    });
    
    final result = await _mockApi.getHyundaiInteger();

    setState(() {
      containerWidthorange = 0.0;
      resultorange = '$result';
    });
  }

  void onPressedRed() async {
    setState(() {
      containerWidthred = 100.0; 
    });

    final result = await _mockApi.getFisherPriceInteger();
    
    setState(() {
      containerWidthred = 0.0;
      resultred = '$result';
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Asynchronous calls'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //boton 1
            Padding(padding: EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(onPressed: onPressedGreen,
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Icon(Icons.flash_on, color: Colors.black)
                ),
              ), 
              ),
            ),
            AnimatedContainer(duration: animationDuration1, // Duración de la animación
                  width: containerWidthgreen,
                  height: 10.0,
                  color: Colors.green),
            Text(resultgreen, style: TextStyle(fontWeight: FontWeight.bold),),
            //boton 2
            Padding(padding: EdgeInsets.symmetric(vertical: 40.0),
            child: ElevatedButton(onPressed: onPressedOrange,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange)), 
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Icon(Icons.directions_bike, color: Colors.black)
                ),
              ),
              ),
            ),
            AnimatedContainer(duration: animationDuration2, // Duración de la animación
                  width: containerWidthorange,
                  height: 10.0,
                  color: Colors.orange),
            Text(resultorange, style: TextStyle(fontWeight: FontWeight.bold),),
            //boton 3
            Padding(padding: EdgeInsets.symmetric(vertical: 40.0),
            child: ElevatedButton(onPressed: onPressedRed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)), 
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Icon(Icons.directions_walk, color: Colors.black)
                ),
              ),)
            ),
            AnimatedContainer(duration: animationDuration3, // Duración de la animación
                  width: containerWidthred,
                  height: 10.0,
                  color: Colors.red),
            Text(resultred, style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  } 
  }
