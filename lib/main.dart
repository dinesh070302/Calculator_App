import 'package:calculator_app/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String expression = "";
  String result = "0";

  void numClick(String text) {
    setState(() {
      if (text == "C") {
        equation = "0";
      } else if (text == "AC") {
        equation = "0";
        result = "0";
      } else if (text == "DEL") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (text == "+/-") {
        if (equation != "0") {
          if (result[0] != "-") {
            result = "-$result";
            equation = result;
          } else {
            result = result.substring(1);
            equation = equation.substring(1);
          }
        }
      } else if (text == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = text;
        } else {
          equation = equation + text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool isSwitched = true;
    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
        });
      } else {
        setState(() {
          isSwitched = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65.0,
        backgroundColor: Colors.black,
        title: Text(
          'Calculator',
          // style: GoogleFonts.montserrat(
          //     fontSize: 30.0, fontWeight: FontWeight.normal),
          style: GoogleFonts.poppins(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SwitchListTile(
            //   value: value,
            //   onChanged: (value) {
            //     setState(() {});
            //   },
            //   title: const Text('Theme'),
            // ),
            Container(
              padding: EdgeInsets.only(right: width / 20),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                equation,
                style: const TextStyle(fontSize: 24, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.all(width / 25),
              alignment: const Alignment(1.0, 1.0),
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: 'AC',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: 'C',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: 'DEL',
                  fillColor: Colors.amber,
                  textColor: Colors.black,
                  textSize: 24.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: "÷",
                  fillColor: Colors.amber,
                  textColor: Colors.black,
                  textSize: 36.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '7',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '9',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: "x",
                  fillColor: Colors.amber,
                  textColor: Colors.black,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '4',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '6',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: Colors.amber,
                  textColor: Colors.black,
                  textSize: 32.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '1',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '3',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: Colors.amber,
                  textColor: Colors.black,
                  textSize: 42.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '+/-',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '0',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '.',
                  fillColor: Colors.black,
                  textColor: Colors.white,
                  textSize: 28.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: Colors.green,
                  textColor: Colors.black,
                  textSize: 36.0,
                  width: width / 5,
                  whenPressed: numClick,
                  height: height / 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
