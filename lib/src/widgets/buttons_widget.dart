import 'package:flutter/material.dart';

class ButtonCustomSubmit extends StatelessWidget {
  ButtonCustomSubmit({
    @required this.textName,
    @required this.functionAction,
  });

  final textName;
  final functionAction;

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    return Material(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          minWidth: double.infinity * .85,
          onPressed: () async {
            functionAction(context);
          },
          child: Text(
            textName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
        ));
  }
}
