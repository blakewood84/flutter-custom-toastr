import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  void _showToast() {

    final Size size  = MediaQuery.of(context).size;

    Widget toast = Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4c5067),
        borderRadius: BorderRadius.circular(5),
      ),
      width: size.width * .85,
      height: 190,
      child: Column(
        children: [
          Container(
            height: 140,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'ERROR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFe60067),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Social Login cannot be used when Email & Password were originally used to set up account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ),
          GestureDetector(
            onTap: () {
              fToast!.removeCustomToast();
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF15d5f3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                )
              )
            ),
          ),
        ],
      )
    );

    fToast!.showToast(
      child: toast,
      toastDuration: Duration(seconds: 10000),
      gravity: ToastGravity.CENTER
    );

  }

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () {
                _showToast();
              }, 
              child: Text('Press Me')
            )
          ],
        )
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
