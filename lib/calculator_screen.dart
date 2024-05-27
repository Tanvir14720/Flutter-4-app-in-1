import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  List<String> history = [];

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X" ||
        buttonText == "^") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "√") {
      _output = (sqrt(double.parse(output))).toString();
    } else if (buttonText == "sin") {
      _output = (sin(double.parse(output) * pi / 180)).toString();
    } else if (buttonText == "cos") {
      _output = (cos(double.parse(output) * pi / 180)).toString();
    } else if (buttonText == "tan") {
      _output = (tan(double.parse(output) * pi / 180)).toString();
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "^") {
        _output = (pow(num1, num2)).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

      history.add("$output = $_output");
    } else {
      // Unit conversion
      switch (buttonText) {
        // Length conversions
        case "m to ft":
          _output = (double.parse(output) * 3.28084).toString();
          break;
        case "ft to m":
          _output = (double.parse(output) / 3.28084).toString();
          break;

        // Weight conversions
        case "kg to lb":
          _output = (double.parse(output) * 2.20462).toString();
          break;
        case "lb to kg":
          _output = (double.parse(output) / 2.20462).toString();
          break;

        // Temperature conversions
        case "°C to °F":
          _output = ((double.parse(output) * 9 / 5) + 32).toString();
          break;
        case "°F to °C":
          _output = ((double.parse(output) - 32) * 5 / 9).toString();
          break;

        default:
          _output = _output + buttonText;
      }
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.teal, // Customize the AppBar color
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ]),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("X")
            ]),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),
            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+")
            ]),
            Row(children: [
              buildButton("CLEAR"),
              buildButton("="),
            ]),
            Row(children: [
              buildButton("m to ft"),
              buildButton("ft to m"),
              buildButton("kg to lb"),
              buildButton("lb to kg"),
            ]),
            Row(children: [
              buildButton("°C to °F"),
              buildButton("°F to °C"),
              // You can add more conversion buttons here if needed
            ]),
            Row(children: [
              buildButton("√"),
              buildButton("^"),
              buildButton("sin"),
              buildButton("cos"),
              buildButton("tan"),
            ]),
          ]),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200, // Adjust the height as needed
                    child: SingleChildScrollView(
                      child: Column(
                        children: history.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
