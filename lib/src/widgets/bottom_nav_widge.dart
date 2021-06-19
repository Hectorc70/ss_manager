import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorSecond = Theme.of(context).primaryColor;
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        ),
        height: 100.0,
        width: widthScreen,
        child: BottomNavigationBar(
          backgroundColor: colorSecond,
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
      width: 50.0,
      height: 50.0,
      color: colorPrimary,
      child: Column(
        children: [
          Icon(Icons.access_alarm),
          Text('Holas'),
        ],
      ),
    );
  }
}
