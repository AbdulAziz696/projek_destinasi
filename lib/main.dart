import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      //buat ngehapus debug yang ada di halaman
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );

  }
}