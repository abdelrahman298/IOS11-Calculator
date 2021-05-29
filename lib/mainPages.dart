import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rowButtons.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '';
  String _output = '';
  void numClick(String newValue) {
    setState(() {
      _result += newValue;
    });
  }

  void deleteData(String newValue) {
    setState(() {
      _result = '';
      _output = '';
    });
  }

  void evaluates(String newValue) {
    Parser p = Parser();
    Expression exp = p.parse(_result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _output = _result;
      _result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              right: 15.0,
              left: 15.0,
              bottom: 15.0,
              top: 50.0,
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _output,
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _result,
                        style: TextStyle(fontSize: 50.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          RowButtons('C', Color(0xffA3A3A3), deleteData),
                          RowButtons('7', Color(0xff333333), numClick),
                          RowButtons('4', Color(0xff333333), numClick),
                          RowButtons('1', Color(0xff333333), numClick),
                          RowButtons('0', Color(0xff333333), numClick),
                        ],
                      ),
                      Column(
                        children: [
                          RowButtons('+/-', Color(0xffA3A3A3), numClick),
                          RowButtons('8', Color(0xff333333), numClick),
                          RowButtons('5', Color(0xff333333), numClick),
                          RowButtons('2', Color(0xff333333), numClick),
                          RowButtons('00', Color(0xff333333), numClick),
                        ],
                      ),
                      Column(
                        children: [
                          RowButtons('%', Color(0xffA3A3A3), numClick),
                          RowButtons('9', Color(0xff333333), numClick),
                          RowButtons('6', Color(0xff333333), numClick),
                          RowButtons('3', Color(0xff333333), numClick),
                          RowButtons('.', Color(0xff333333), numClick),
                        ],
                      ),
                      Column(
                        children: [
                          RowButtons('/', Color(0xffF09A3A), numClick),
                          RowButtons('*', Color(0xffF09A3A), numClick),
                          RowButtons('-', Color(0xffF09A3A), numClick),
                          RowButtons('+', Color(0xffF09A3A), numClick),
                          RowButtons('=', Color(0xffF09A3A), evaluates),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
