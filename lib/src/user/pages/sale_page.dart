import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/forms/sale_form.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';
import 'package:ss_manager/src/utils/preferences_user.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/main_lateral.dart';
import 'package:ss_manager/src/widgets/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class SalePage extends StatefulWidget {
  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    _load().then((value) => null);
    super.initState();
  }

  Future _load() async {
    final prefs = PreferencesUser();
    final sales = Provider.of<SaleProvider>(context, listen: false);

    if (sales.salesTodayDB.length  == 0) {
      final data = await sales.getSalesToday(prefs.dataUser);
      if (data[0] == 1) {
        sales.salesTodayDB = data[1].items;
        sales.totalToday = data[1].total;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final order = Provider.of<SaleProvider>(context);
    final colorSecond = Theme.of(context).colorScheme.secondary;

    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: LateralMain(),
          appBar: AppBar(
              elevation: 0.0,
              toolbarHeight: 140.0,
              flexibleSpace: Container(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ventas',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  )),
              leading: IconButton(
                  alignment: AlignmentDirectional.topStart,
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(
                    ManagerIcons.menuCustom,
                    color: colorSecond,
                  ))),
          body: Stack(
            children: [
              Container(
                color: colorP,
                height: heightScreen,
              ),
              BodyCustomWidget(
                childWidget: _Body(),
                heightW: heightScreen,
                widthtW: widthScreen,
                paddingW: EdgeInsets.all(0.0),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBarCustom(),
        ),
        onWillPop: () {
          return new Future(() => false);
        });
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.secondaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final sales = Provider.of<SaleProvider>(context);
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: Column(
        children: [
          NameSection(
            textW: 'Mis Ventas',
            childWidget: ButtonTitleAdd(
              functionAction: _addNewSale,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView.builder(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                    itemCount: sales.salesTodayDB.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CardSale(
                            title: sales.salesTodayDB[index].product,
                            pieces: sales.salesTodayDB[index].pieces,
                            total: sales.salesTodayDB[index].total,
                            functionAction: () {},
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      );
                    })),
          )
        ],
      ),
    );
  }

  _addNewSale(BuildContext context) async {
    conteDialogBottom(context, SaleForm());
  }
}
