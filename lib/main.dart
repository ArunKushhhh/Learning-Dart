import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void test() {
  //Operators
  final age = 19;
  final halfOfAge = age / 2;
  final doubleTheAge = age * 2;
  print(halfOfAge);
  print(doubleTheAge);

  //list
  var count = ['one', 'two', 'three'];
  print(count[0]);
  print(count.length);
  count.add("four");
  print(count);

  //Sets
  var num = {1, 2, 3, 4};
  num.add(5);
  print(num);

  //Map
  var person = {'name': "Arun", 'age': 19};
  person['name'] = "Kushwaha Ji";
  print(person);

  //Null Safety
  var name = '';
  print(name);
  //Making a type nullable
  const String? name2 = null;
  //but the value of this constant cannot be updated because of the reserved keyword "const" that has been used
  String? name3 = null;
  name3 = "Kushwaha";

  //we cannot assign "null" value to any operator until we make it ready to accept null value
  //int age2 = 19;
  // age2= null;

  int? age2 = 19;
  age2 = null;

  // List<String> words = ['one', 1]; //this gives an error as strign list cannot contain integers
  List<String>? words = null; //nullable list
  List<String?>? letters = ['one', null]; //nullable list of nullable strings

  const String? firstname = null;
  const String? middlename = 'Kumar';
  const String? lastname = 'Kushwaha';

  //conventional value to check and terminate the condition when the system finds first non null value
  // if (firstname != null) {
  //   print("firstname is not null");
  // } else if (middlename != null) {
  //   print("middlename is not null");
  // } else if (lastname != null) {
  //   print("lastname is not null");
  // }

  //New/Better way to write the same statement is:
  //What happens here is that ?? is an infix operator.. so if the left hand side value of the operator is null, the right hand value is never executed
  //However, if we make the middlename null as well, then the firstNonNullValue variable will take lastname as its value and store it
  // const firstNonNullValue = firstname ?? middlename ?? lastname;
  // return(firstNonNullValue);
  String? nonNullNames(
      String? firstname, String? middlename, String? lastname) {
    final firstNonNullValue = firstname ?? middlename ?? lastname;
    print(firstNonNullValue);
    return (firstNonNullValue);
  }

  //null over assignment operator
  void test(String? firstname, String? middlename, String? lastname) {
    String? name = firstname;
    name ??= lastname;
    print(name);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
