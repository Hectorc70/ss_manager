import 'package:flutter/material.dart';

class BodyCustomWidget extends StatelessWidget {
  BodyCustomWidget({
    @required this.childWidget,
    this.heightW,
  });
  final childWidget;
  final heightW;
  @override
  Widget build(BuildContext context) {
    final colorPV = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color: colorPV,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.0),
        ),
      ),
      height: this.heightW,
      width: widthScreen,
      child: this.childWidget,
    );
  }
}

class HeaderCustomWidget extends StatelessWidget {
  HeaderCustomWidget({
    @required this.childWidget,
    this.heightW,
  });

  final childWidget;
  final heightW;
  @override
  Widget build(BuildContext context) {
    final widthS = MediaQuery.of(context).size.width;
    return Container(
      height: this.heightW,
      width: widthS,
      child: this.childWidget,
    );
  }

  _figure() {}
}
