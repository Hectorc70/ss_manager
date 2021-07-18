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
      child: Row(
        children: [
          Text(
            "Ventas Recientes",
            style: TextStyle(
                color: Color.fromRGBO(46, 46, 46, 1),
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
            textAlign: TextAlign.left,
          ),
          childWidget,
        ],
      ),
    );
  }
}



class ButtonAddTitle extends StatelessWidget {
  const ButtonAddTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}