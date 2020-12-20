import 'package:flutter/material.dart';

class CalculatorKeyoperation extends StatelessWidget {
  final Widget widget;
  final Function callback;
  final String text;
  const CalculatorKeyoperation(
    this.widget, {
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
          color: Color(0xfffff8cd),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            callback(text);
          },
          child: Center(child: widget),
        ),
      ),
    );
  }
}
