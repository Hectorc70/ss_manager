import 'package:flutter/material.dart';

class AppBarHomeCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget welcome = Text(
      'Hola Bienvenido!',
      style: TextStyle(
        fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 22.0,
        color: Colors.white,
      ),
    );

    final colorPrincipal = Theme.of(context).primaryColor;
    return Container(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 70.0, 5.0),
        decoration: BoxDecoration(
          color: colorPrincipal,
        ),
      ),
    );
  }
}

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorSecond = Theme.of(context).colorScheme.secondary;

    return Container(
        height: 200.0,
        color: colorSecond,
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
      width: 100.0,
      height: 100.0,
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
