import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BodyCustomWidget extends StatefulWidget {
  BodyCustomWidget({
    @required this.childWidget,
    @required this.heightW,
    @required this.widthtW,
  });
  final childWidget;
  final heightW;
  final widthtW;

  @override
  State<BodyCustomWidget> createState() => _BodyCustomWidgetState();
}

class _BodyCustomWidgetState extends State<BodyCustomWidget> {
  double widthContainer = 0.0;
  double heightContainer = 0.0;
  double transX = 400.0;
  double transY = 500.0;
  double childOpacity = 0.0;
  void initState() {
    super.initState();
    Timer(Duration(microseconds: 0), () {
      setState(() {
        widthContainer = widget.widthtW;
        heightContainer = widget.heightW;
        transX = 0.0;
        transY = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorPV = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      height: heightContainer,
      width: widthContainer,
      transform: Matrix4.translationValues(transX, transY, 0.0),
      transformAlignment: AlignmentDirectional.center,
      alignment: Alignment.center,
      curve: Curves.bounceIn,
      padding: EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color: colorPV,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.0),
        ),
      ),
      duration: Duration(seconds: 1),
      onEnd: () {
        setState(() {
          childOpacity = 1.0;
        });
      },
      child: AnimatedOpacity(
        opacity: childOpacity,
        duration: Duration(seconds: 2),
        child: widget.childWidget,
      ),
    );
  }
}

class HeaderCustomWidget extends StatelessWidget {
  HeaderCustomWidget({
    @required this.childWidget,
    this.heightW,
    this.widthW,
  });

  final childWidget;
  final heightW;
  final widthW;
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.primary;
    return Container(
      color: colorP,
      height: this.heightW,
      width: this.widthW,
      child: this.childWidget,
    );
  }

  _figure() {}
}
