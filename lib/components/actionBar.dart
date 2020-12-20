import 'package:flutter/material.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Text(
              'CALCULATOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1.5,
                  color: Color(0xfff8aa1b),
                  fontSize: 22,
                  fontWeight: FontWeight.w800),
            )),
      ],
    );
  }
}
