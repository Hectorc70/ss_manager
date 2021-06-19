import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
        decoration: BoxDecoration(
          color: colorP,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        height: 80.0,
        width: widthScreen,
        child: BottomNavigationBar(
          backgroundColor: colorP,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                icon: _bottomNavBarItemCustom(context), label: ''),
            BottomNavigationBarItem(
                icon: _bottomNavBarItemCustom(context), label: ''),
          ],
        ));
  }

  Widget _bottomNavBarItemCustom(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;
    return Container(
      width: 40.0,
      height: 40.0,
      color: colorPrimary,
      child: Column(
        children: [
          Icon(
            Icons.access_alarm,
            size: 10.0,
          ),
          Text('Holas'),
        ],
      ),
    );
  }
}
