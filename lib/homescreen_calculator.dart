import 'package:calcualtor/Components/my_button.dart';
import 'package:calcualtor/Constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class homescreen_calculator extends StatefulWidget {
  const homescreen_calculator({Key? key}) : super(key: key);

  @override
  State<homescreen_calculator> createState() => _homescreen_calculatorState();
}

class _homescreen_calculatorState extends State<homescreen_calculator> {
  var userinput = ' ';
  var answer = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userinput.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1, //occupies 2/3 of the screen
                child: Column(
                  children: [
                    Row(
                      children: [
                        Mybutton(
                          title: 'AC',
                          fontSize: 19,
                          heights: 63,
                          onpress: () {
                            userinput = " ";
                            answer = " ";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: 'DEL',
                          fontSize: 19,
                          heights: 63,
                          onpress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '%',
                          fontSize: 25,
                          heights: 63,
                          onpress: () {
                            userinput += "%";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                            title: '/',
                            fontSize: 25,
                            heights: 63,
                            colors: const Color(0xffffa00a),
                            onpress: () {
                              userinput += "/";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '7',
                          onpress: () {
                            userinput += "7";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '8',
                          onpress: () {
                            userinput += "8";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '9',
                          onpress: () {
                            userinput += "9";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                            title: '*',
                            fontSize: 25,
                            heights: 63,
                            colors: const Color(0xffffa00a),
                            onpress: () {
                              userinput += "x";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '4',
                          onpress: () {
                            userinput += "4";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '5',
                          onpress: () {
                            userinput += "5";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '6',
                          onpress: () {
                            userinput += "6";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                            title: '-',
                            fontSize: 25,
                            heights: 63,
                            colors: const Color(0xffffa00a),
                            onpress: () {
                              userinput += "-";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '1',
                          onpress: () {
                            userinput += "1";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '2',
                          onpress: () {
                            userinput += "2";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '3',
                          onpress: () {
                            userinput += "3";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                            title: '+',
                            fontSize: 25,
                            heights: 63,
                            colors: const Color(0xffffa00a),
                            onpress: () {
                              userinput += "+";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Mybutton(
                          title: '00',
                          onpress: () {
                            userinput += "00";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '0',
                          onpress: () {
                            userinput += "0";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                          title: '.',
                          onpress: () {
                            userinput += ".";
                            setState(() {});
                          },
                        ),
                        Mybutton(
                            title: '=',
                            fontSize: 25,
                            heights: 63,
                            colors: Colors.red,
                            onpress: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalinput = userinput;
    finalinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
