import 'package:flutter/material.dart';

class NameSection extends StatelessWidget {
  NameSection({
    this.childWidget,
    @required this.textW,
  });
  final childWidget;
  final textW;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.textW,
            style: TextStyle(
                color: Color.fromRGBO(46, 46, 46, 1),
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ),
          SizedBox(
            width: 10.0,
          ),
          childWidget,
        ],
      ),
    );
  }
}
