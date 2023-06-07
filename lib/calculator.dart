import 'package:calculator/constants.dart';
import 'package:calculator/dark_neumorph_button.dart';
import 'package:calculator/light_neumorph_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String inputText = '';
  String answerText = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            answerText = answerText,
                            style: TextStyle(color: tealColor, fontSize: 40),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            inputText = inputText.toString(),
                            style: TextStyle(color: tealColor, fontSize: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        DarkNeumorphButton(
                          buttonText: 'AC',
                          textColor: tealColor,
                          fontSize: 23,
                          onPressed: () {
                            inputText = '';
                            answerText = '0';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '+/-',
                          textColor: tealColor,
                          fontSize: 23,
                          onPressed: () {
                            inputText += '';
                            if (answerText[0] != '-') {
                              answerText = '-' + answerText;
                            } else {
                              answerText =
                                  answerText.substring(1, answerText.length);
                            }
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '%',
                          textColor: tealColor,
                          fontSize: 25,
                          onPressed: () {
                            inputText += '%';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          radius: 10,
                          height: 60,
                          width: 60,
                          buttonText: '/',
                          textColor: tealColor,
                          fontSize: 25,
                          onPressed: () {
                            inputText += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DarkNeumorphButton(
                          buttonText: '7',
                          onPressed: () {
                            inputText += '7';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '8',
                          onPressed: () {
                            inputText += '8';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '9',
                          onPressed: () {
                            inputText += '9';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: 'x',
                          radius: 10,
                          height: 60,
                          width: 60,
                          textColor: tealColor,
                          fontSize: 25,
                          onPressed: () {
                            inputText += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DarkNeumorphButton(
                          buttonText: '4',
                          onPressed: () {
                            inputText += '4';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '5',
                          onPressed: () {
                            inputText += '5';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '6',
                          onPressed: () {
                            inputText += '6';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '-',
                          radius: 10,
                          height: 60,
                          width: 60,
                          textColor: tealColor,
                          fontSize: 30,
                          onPressed: () {
                            inputText += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DarkNeumorphButton(
                          buttonText: '1',
                          onPressed: () {
                            inputText += '1';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '2',
                          onPressed: () {
                            inputText += '2';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '3',
                          onPressed: () {
                            inputText += '3';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '+',
                          radius: 10,
                          height: 60,
                          width: 60,
                          textColor: tealColor,
                          fontSize: 25,
                          onPressed: () {
                            inputText += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DarkNeumorphButton(
                          buttonText: '0',
                          onPressed: () {
                            inputText += '0';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: '.',
                          onPressed: () {
                            inputText += '.';
                            setState(() {});
                          },
                        ),
                        DarkNeumorphButton(
                          buttonText: 'DEL',
                          fontSize: 18,
                          onPressed: () {
                            inputText =
                                inputText.substring(0, inputText.length - 1);
                            setState(() {});
                          },
                        ),
                        LightNeumorphButton(
                          onPressed: () {
                            calculation();
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculation() {
    String userInput = inputText.replaceAll('x', '*');
    Parser parser = Parser();
    Expression exp = parser.parse(userInput);

    ContextModel contextModel = ContextModel();
    double answer = exp.evaluate(EvaluationType.REAL, contextModel);
    answerText = answer.toString();
  }
}
