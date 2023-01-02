import 'package:flutter/material.dart';
import 'package:calculator/components/round_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(children: [
                Row(
                  children: [
                    RoundButton(
                      name: 'AC',
                      onPress: () {
                       userInput ='';
                       answer='';
                       setState(() {

                       });
                      },
                    ),
                    RoundButton(
                      name: '+/-',
                      onPress: () {
                        userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '%',
                      onPress: () {
                      userInput += '%';
                      setState(() {});
                        },
                    ),
                    RoundButton(
                      name: '/',
                      color: Color(0xffffa00a),
                      onPress: () {
                      userInput += '/';
                      setState(() {});
                      },

                    ),
                  ],
                ),
                Row(
                  children: [
                    RoundButton(
                      name: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {

                        });
                      },
                    ),
                    RoundButton(
                      name: '9',
                      onPress: () {
    userInput += '9';
    setState(() {});

                      },
                    ),
                    RoundButton(
                      name: 'x',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    RoundButton(
                      name: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '-',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    RoundButton(
                      name: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '+',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    RoundButton(
                      name: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '.',
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: 'DEL',
                      onPress: () {
                        userInput= userInput.substring(0,userInput.length-1);
                        setState(() {});
                      },
                    ),
                    RoundButton(
                      name: '=',
                      color: Color(0xffffa00a),
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ));
  }
  void equalPress(){
    final finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer= eval.toString();

  }
}
