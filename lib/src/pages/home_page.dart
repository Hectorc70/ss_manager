import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/validations/autenticacion.dart';
import 'package:ss_manager/src/widgets/custom_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorSecond = Theme.of(context).colorScheme.secondary;
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: Stack(
        children: [
          WillPopScope(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(double.infinity, 200),
                  child: AppBarHomeCustom(),
                ),
                body: BodyHome(),
                bottomNavigationBar: BottomNavBarCustom(),
              ),
              onWillPop: () {
                return new Future(() => false);
              }),
          Column(
            children: [
              SafeArea(child: Container(height: 150.0)),
              CardSaleToday(),
            ],
          )
        ],
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorSecond = Theme.of(context).colorScheme.secondary;
    return Container(
      width: double.infinity,
      color: colorSecond,
      child: Column(
        children: [
          _title(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Ultimas Ventas",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 22.0),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    final cardOptionReportar = Container(
      color: Colors.red,
      child: Column(
        children: [Icon(Icons.report), Text('Reportar Error')],
      ),
    );
    return Container(
        child: ListView(
      scrollDirection: Axis.horizontal,
      children: [cardOptionReportar],
    ));
  }
}

class CardSaleToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final colorSecond2 = Theme.of(context).colorScheme.secondaryVariant;
    final colorP = Theme.of(context).primaryColor;

    return Container(
      height: 100.0,
      width: widthScreen * .95,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: colorSecond2,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
              spreadRadius: 2.0,
            )
          ]),
      child: Row(children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Vendido Hoy',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0),
              ),
              Text(
                "\$ 200.00",
                style: TextStyle(
                    color: colorP, fontWeight: FontWeight.w600, fontSize: 25.0),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
