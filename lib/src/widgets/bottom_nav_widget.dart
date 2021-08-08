import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/providers/nav_ui.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final colorP = Theme.of(context).primaryColor;
    final colorS2 = Theme.of(context).colorScheme.secondaryVariant;
    final colorA = Theme.of(context).colorScheme.primaryVariant;

    final widthScreen = MediaQuery.of(context).size.width;

    int indexSelect = uiprovider.selectOption;
    return BottomNavigationBar(
      backgroundColor: colorA,
      elevation: 0.0,
      iconSize: 25.0,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: indexSelect,
      onTap: (index) async {
        if (index == 0) {
          uiprovider.selectOption = index;
        } else if (index == 1) {
          uiprovider.selectOption = index;
        } else if (index == 2) {
          uiprovider.selectOption = index;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2), label: 'Inventario'),
        BottomNavigationBarItem(icon: Icon(Icons.sell), label: 'Ventas'),
      ],
    );
  }

  _iconOption(Widget childW) {
    return Container(width: 50, height: 50, child: childW);
  }
}
