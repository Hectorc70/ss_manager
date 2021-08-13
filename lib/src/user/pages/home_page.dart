import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/manager_icons_icons.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final order = Provider.of<SaleProvider>(context);

    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: LateralMain(),
          appBar: AppBar(
              elevation: 0.0,
              toolbarHeight: 140.0,
              flexibleSpace: Container(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hola Hector Bienvenido',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _dataSaleToday(context),
                  ],
                ),
              ),
              leading: IconButton(
                  alignment: AlignmentDirectional.topStart,
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(ManagerIcons.menuCustom))),
          body: Stack(children: [
            Container(
              color: colorP,
              height: heightScreen,
            ),
            BodyCustomWidget(
              childWidget: _BodyHome(),
              heightW: heightScreen,
              widthtW: widthScreen,
              paddingW: EdgeInsets.all(35.0),
            )
          ]),
          bottomNavigationBar: BottomNavBarCustom(),
        ),
        onWillPop: () {
          return new Future(() => false);
        });
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

class LateralMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final infoApp = Provider.of<AppInfo>(context);
    //final colorBackCard = Colors.red;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorPrimary = Theme.of(context).primaryColor;
    final colorB = Color.fromRGBO(163, 136, 197, 1);
    return Drawer(
        elevation: 5.0,
        child: Column(children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: widthScreen,
              height: 140.0,
              color: colorPrimary,
              child: logoApp(context, Text('')),
            ),
          ),
          Expanded(
              child: ListView(children: [
            _opcionMenu(
                context, 'Mis Negocios', ManagerIcons.market, colorB, _func),
          ]))
        ]));
  }

  _func(BuildContext context) {}

  _opcionMenu(
      BuildContext context, String text, IconData icon, colorIcon, function) {
    final colorPrimary = Theme.of(context).primaryColor;
    final functionAction = function;
    return ListTile(
      leading: Icon(
        icon,
        color: colorIcon,
      ),
      title: Text(text,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontFamily: 'Poppins',
              fontSize: 16.0,
              fontWeight: FontWeight.w400)),
      onTap: () {
        functionAction(context);
      },
    );
  }
}
