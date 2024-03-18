import 'package:flutter/material.dart';
import './bodys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHome(),
      theme:ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 53, 52, 52),
        appBarTheme:const AppBarTheme(
            backgroundColor: Color.fromARGB(197, 95, 140, 159)
        ),
      )
    );
  }
}

class MyHome extends StatefulWidget{

  const MyHome({super.key});
  @override
  State<MyHome> createState()=>MyHomeState();
}

class MyHomeState extends State<MyHome>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
          ),
        centerTitle: true,
      ),
      body: MyBody(),
    );
  }
}



