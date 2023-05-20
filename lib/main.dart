import 'package:flutter/material.dart';

import 'homescreen_calculator.dart';

void main() {
  //print ("Hello World");
  runApp(const calculator());
}

class calculator extends StatelessWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen_calculator(),
    );
  }
}

