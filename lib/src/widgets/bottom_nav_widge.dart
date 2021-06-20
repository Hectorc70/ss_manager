import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorS2 = Theme.of(context).colorScheme.secondaryVariant;
    final colorA = Theme.of(context).accentColor;

    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
        color: colorS2,
        child: Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            decoration: BoxDecoration(
                color: colorP,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            height: 80.0,
            width: widthScreen,
            child: BottomNavigationBar(
              backgroundColor: colorP,
              elevation: 0.0,
              iconSize: 25.0,
              selectedItemColor: colorA,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Inicio'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.inventory_2), label: 'Inventario'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sell), label: 'Ventas'),
              ],
            )));
  }
}
