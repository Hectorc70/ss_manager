import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/Manager_icons_.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final order = Provider.of<SaleProvider>(context);

    return Material(
        child: WillPopScope(
            child: Stack(
              children: [
                _background(context),
                Column(
                  children: [
                    HeaderCustomWidget(
                      childWidget: Stack(
                        children: [
                          SafeArea(child: Container()),
                          Column(
                            children: [_appBarHome(), _dataSaleToday(context)],
                          )
                        ],
                      ),
                      heightW: 180.0,
                    ),
                    Expanded(
                        child: BodyCustomWidget(
                      childWidget: _BodyHome(),
                      heightW: heightScreen - 180.0,
                      widthtW: widthScreen,
                      paddingW: EdgeInsets.all(35.0),
                    )),
                  ],
                ),
              ],
            ),
            onWillPop: () {
              return new Future(() => false);
            }));
  }

  Widget _background(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.primary;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: colorP),
    );
  }

  Widget _appBarHome() {
    return AppBar(
        elevation: 0.0,
        toolbarHeight: 60.0,
        title: Text('Hola Hector Bienvenido'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Manager.menuCustom)));
  }

  Widget _dataSaleToday(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 40.0),
      width: widthScreen,
      alignment: AlignmentDirectional.topStart,
      height: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total vendido Hoy',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Text(
            '\$ 50.0',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}

class _BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.secondaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: Column(
        children: [
          NameSection(
            textW: 'Ventas Recientes',
            childWidget: ButtonTitleAdd(
              functionAction: _addNewSale,
            ),
          )
        ],
      ),
    );
  }

  _addNewSale(BuildContext context) {
    Navigator.of(context).pushNamed('newSale');
  }
}
