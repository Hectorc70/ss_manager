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
          Text(this.textW, style: Theme.of(context).textTheme.headline5),
          SizedBox(
            width: 10.0,
          ),
          childWidget,
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      this.heightWidget,
      @required this.iconCard,
      @required this.colorIconConte,
      @required this.functionAction})
      : super(key: key);

  final heightWidget;
  final iconCard;
  final colorIconConte;
  final functionAction;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return TextButton(
        onPressed: () async {
          functionAction(context);
        },
        child: Container(
          width: widthScreen,
          height: heightWidget,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10.0,
                    spreadRadius: 5.0)
              ]),
          child: Row(
            children: [
              Container(
                width: heightWidget,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: colorIconConte,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
                child: Icon(
                  iconCard,
                  color: Colors.white,
                  size: 35.0,
                ),
              )
            ],
          ),
        ));
  }
}
