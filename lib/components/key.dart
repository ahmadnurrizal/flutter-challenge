import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  final Function callback;
  final String text;
  const CalculatorKey({
    this.text,
    this.callback,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffe8e8e8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            callback(text);
          },
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
