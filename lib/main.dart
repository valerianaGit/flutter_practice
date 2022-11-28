import 'package:flutter/material.dart';

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

        primarySwatch: Colors.blue,
      ),
      home: BasicKeyPage(),
    );
  }
}

//MARK: GLOBAL KEY TUTORIAL

class BasicKeyPage extends StatelessWidget {
  //MARK:  Step 1 - this is the state we want access to
  // we can use this to access the state of the stateful widget
  final keyCounter = GlobalKey<_CounterWidgetState>();
  BasicKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Key Testing'),
      ),
      //MARK: STEP 2 - We need a KEY in the constructor of
      //the state we are tracking.
      // we are using the SUPER KEY that comes
      //with the default stateful widget
      body: CounterWidget(key: keyCounter),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
//MARK: STEP 3 -  Use the parameter to access the state ,
//3.1 -  Access parameters (with currentState)
//this is included in the global key class
            final counter = keyCounter.currentState!.counter;
            //once inside .currentState, we can access
            //methods and values inside the class,
            //in this case, we can access counter parameter
            //from the CounterWidgetState class

//MARK: STEP 3.2 Access methods (with currentState)
            keyCounter.currentState!.increment();
          }),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // parameter we can access with global key
  int counter = 0;
  // method we can access with global key 
  // notice we still use set state in the stateful widget
  // since global key is used to track state of stateful widgets 
  void increment() => setState(() {
        counter += 5;
      });
  @override
  Widget build(BuildContext context) {
    return Text(
      'Counter: $counter',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }
}
