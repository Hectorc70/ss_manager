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
        borderRadius: BorderRadius.circular(7.0),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          minWidth: double.infinity,
          onPressed: () async {
            functionAction(context);
          },
          child: Text(
            textName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
        ));
  }
}

class ButtonCustomForm extends StatelessWidget {
  ButtonCustomForm({
    @required this.textName,
    @required this.width,
    @required this.functionAction,
    @required this.colorBtn,
  });

  final textName;
  final functionAction;
  final width;
  final colorBtn;

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    return Material(
        color: colorBtn,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          minWidth: width,
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

class ButtonTitleAdd extends StatelessWidget {
  ButtonTitleAdd({
    @required this.functionAction,
  });

  final functionAction;

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    return Container(
        alignment: AlignmentDirectional.center,
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: IconButton(
        
            alignment: AlignmentDirectional.center,
            onPressed: () {
              this.functionAction(context);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 25.0,
            )));
  }
}
