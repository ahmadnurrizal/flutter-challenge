import 'package:flutter/material.dart';
import 'components/actionBar.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_challange/components/keyOperation.dart';
import 'components/key.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      title: 'Xiaomi Calculator Clone',
      home: XiaomiCalculator(),
    );
  }
}

class XiaomiCalculator extends StatefulWidget {
  const XiaomiCalculator({
    Key key,
  }) : super(key: key);

  @override
  _XiaomiCalculatorState createState() => _XiaomiCalculatorState();
}

class _XiaomiCalculatorState extends State<XiaomiCalculator> {
  String result = '';
  String history = '';
  void click(String s) {
    setState(() {
      result += s;
    });
  }

  void evaluate(String s) {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      history = result;
      result = eval.toStringAsFixed(2);
    });
  }

  void clear(String s) {
    setState(() {
      result = '';
      history = '';
    });
  }

  void erase(String s) {
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  void pow(String s) {
    setState(() {
      result = (double.parse(result) * double.parse(result)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF9F3),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.only(bottom: 30), child: ActionsBar()),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              history,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black54),
                            ),
                          ),
                          Text(
                            result,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 45),
                          ),
                        ],
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 22,
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 13,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 3, right: 3),
                  child: GridView.count(
                    physics: new NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 5,
                    crossAxisCount: 4,
                    children: <Widget>[
                      CalculatorKeyoperation(
                        Text('AC',
                            style: TextStyle(
                              color: Color(0xffffb836),
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            )),
                        callback: clear,
                      ),
                      CalculatorKeyoperation(
                        Icon(
                          Icons.backspace,
                          color: Color(0xffffb836),
                        ),
                        callback: erase,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/%.png',
                          height: 22,
                        ),
                        text: '%',
                        callback: click,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/bagi.png',
                          height: 25,
                        ),
                        text: '/',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '7',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '8',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '9',
                        callback: click,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/kali.png',
                          height: 18,
                        ),
                        text: '*',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '4',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '5',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '6',
                        callback: click,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/-.png',
                          width: 20,
                        ),
                        text: '-',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '1',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '2',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '3',
                        callback: click,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/+.png',
                          height: 23,
                        ),
                        text: '+',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '0',
                        callback: click,
                      ),
                      CalculatorKey(
                        text: '.',
                        callback: click,
                      ),
                      CalculatorKeyoperation(
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Image.asset(
                            'images/kuadrat.png',
                            height: 23,
                          ),
                        ),
                        callback: pow,
                      ),
                      CalculatorKeyoperation(
                        Image.asset(
                          'images/equal.png',
                          height: 13,
                        ),
                        text: '=',
                        callback: evaluate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
