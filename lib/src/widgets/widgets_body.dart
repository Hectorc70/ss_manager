import 'dart:math';

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

class CardSale extends StatefulWidget {
  CardSale({this.title, Key? key}) : super(key: key);

  final title;
  @override
  _CardSaleState createState() => _CardSaleState();
}

class _CardSaleState extends State<CardSale> {
  _colorRamdom() {
    List<Color> colors = [
      Color.fromRGBO(148, 197, 136, 1),
      Color.fromRGBO(197, 136, 136, 1),
      Color.fromRGBO(163, 136, 197, 1),
      Color.fromRGBO(136, 171, 197, 1),
    ];

    final ramdom = Random();
    final numIndex = ramdom.nextInt(4);
    //print(colors[numIndex]);
    return colors[numIndex];
  }

  @override
  Widget build(BuildContext context) {
    final colorTextName = Color.fromRGBO(119, 115, 115, 1);
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              padding: EdgeInsetsDirectional.all(5.0),
              width: widthScreen - 100.0,
              height: 80,
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
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: colorTextName,
                        fontFamily: 'PoppinsBold',
                        fontSize: 16.0),
                  ),
                  Expanded(child: SizedBox()),
                  Column(
                    children: [
                      Text(
                        '\$ data',
                        style: TextStyle(
                            color: colorTextName,
                            fontFamily: 'PoppinsBold',
                            fontSize: 16.0),
                      ),
                      Text(
                        'data',
                        style: TextStyle(
                            color: colorTextName,
                            fontFamily: 'Poppins',
                            fontSize: 16.0),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
          ),
          Container(
            width: 70,
            height: 70,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: _colorRamdom(),
              borderRadius: BorderRadius.all(
                Radius.circular(35.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10.0,
                    spreadRadius: 5.0)
              ],
            ),
            child: Text(
              '${widget.title[0]}',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsBold',
                  fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
