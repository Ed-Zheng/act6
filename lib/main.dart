import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;

  void _liftoff() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("🚀 LIFTOFF!!! 🚀"),
          content: const Text("You launched the rocket!!!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      //set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Text(
                //to displays current number
                '$_counter',
                style: TextStyle(
                  fontSize: 50.0,
                  color: _counter == 0
                    ? Colors.red
                    : (_counter >= 50 ? Colors.green : Colors.orange)
                ),
              ),
            ),
          ),

          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_counter > 0) _counter--;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text("ABORT"),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_counter < 100) {
                      _counter++;
                      if (_counter == 100) {
                        _liftoff();
                      }
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("IGNITE"),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter = 0;
                  });
                } ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text("RESET"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
