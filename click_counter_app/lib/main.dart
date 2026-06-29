import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: CounterScreen());
  }
}

class CounterScreen extends StatefulWidget {
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 183, 163),
      appBar: AppBar(title: Text('Counter')),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$counter', style: TextStyle(fontSize: 250)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  width: 300,
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 3, 15, 26),
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: increment, child: Text(' + ')),
                      ElevatedButton(onPressed: decrement, child: Text(' - ')),
                      ElevatedButton(onPressed: reset, child: Text(' ♻️ ')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}