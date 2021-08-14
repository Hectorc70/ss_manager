import 'package:flutter/material.dart';
import 'package:ss_manager/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/main_lateral.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorP = Theme.of(context).primaryColor;
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
                        'Inventario',
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
          body: Stack(children: [
            Container(
              color: colorP,
              height: heightScreen,
            ),
            BodyCustomWidget(
              childWidget: _BodyInventory(),
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
}

class _BodyInventory extends StatelessWidget {
  const _BodyInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: double.infinity,
      child: Column(
        children: [
          NameSection(
            textW: 'Mis Productos',
            childWidget: ButtonTitleAdd(
              functionAction: _addNewProduct,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: ListView(
              children: [
                CardItem(
                    heightWidget: 80.0,
                    iconCard: ManagerIcons.market,
                    colorIconConte: Colors.cyan)
              ],
            ),
          )
        ],
      ),
    );
  }

  _addNewProduct(BuildContext context) {
    Navigator.of(context).pushNamed('newSale');
  }
}
