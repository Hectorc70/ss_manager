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
      @required this.pieces,
      @required this.nameProduct,
      @required this.price,
      @required this.iconCard,
      @required this.colorIconConte,
      @required this.functionAction})
      : super(key: key);

  final heightWidget;
  final iconCard;
  final colorIconConte;
  final functionAction;
  final pieces;
  final nameProduct;
  final price;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorContePieces = Color.fromRGBO(42, 186, 186, 1);
    final colorTextName = Color.fromRGBO(119, 115, 115, 1);
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
          child: Stack(
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
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '\$ $price',
                      style: TextStyle(
                          color: colorTextName,
                          fontFamily: 'Poppins',
                          fontSize: 18.0),
                      textAlign: TextAlign.left,
                    ),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    nameProduct,
                    style: TextStyle(
                        color: colorTextName,
                        fontFamily: 'PoppinsBold',
                        fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: colorContePieces,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10.0)),
                  ),
                  child: Text(
                    'X $pieces',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
