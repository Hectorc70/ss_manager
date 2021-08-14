import 'package:flutter/material.dart';
import 'package:ss_manager/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorP = Theme.of(context).primaryColor;
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              toolbarHeight: 140.0,
            ),
            body: Stack(children: [
              Container(
                color: colorP,
                height: heightScreen,
              ),
              BodyCustomWidget(
                heightW: heightScreen,
                widthtW: widthScreen,
                childWidget: _BodyHome(),
              ),
            ])),
        onWillPop: () {
          return new Future(() => false);
        });
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
      padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 10.0),
      width: widthScreen,
      child: Column(
        children: [
          NameSection(
            textW: 'Negocios',
            childWidget: ButtonTitleAdd(
              functionAction: _addNewSale,
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

  _addNewSale(BuildContext context) {
    Navigator.of(context).pushNamed('newSale');
  }
}
