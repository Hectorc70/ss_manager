import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/forms/sale_form.dart';

import 'package:ss_manager/src/user/providers/sales_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/logo.dart';
import 'package:ss_manager/src/widgets/main_lateral.dart';
import 'package:ss_manager/src/widgets/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorSecond = Theme.of(context).colorScheme.secondary;
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
                  icon: Icon(
                    ManagerIcons.menuCustom,
                    color: colorSecond,
                  ))),
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

  _addNewSale(BuildContext context) async {
    conteDialogBottom(context, SaleForm());
  }
}
