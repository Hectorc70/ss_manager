import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/forms/new_order_form.dart';
import 'package:ss_manager/src/user/providers/orders_provider.dart';

import 'package:ss_manager/src/widgets/bottom_nav_widge.dart';
import 'package:ss_manager/src/widgets/custom_widgets.dart';

class NewOrdePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final colorAcent = Theme.of(context).colorScheme.primaryVariant;
    final width = MediaQuery.of(context).size.width;
    final order = Provider.of<OrderProvider>(context);

    return Material(
      child: WillPopScope(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: AppBarHomeCustom(),
            ),
            body: Stack(
              children: [
                Container(
                  color: colorP,
                ),
                BodyHome(),
              ],
            ),
            bottomNavigationBar: BottomNavBarCustom(),
          ),
          onWillPop: () {
            return new Future(() => false);
          }),
    );
  }
}

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).colorScheme.secondaryVariant;

    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: colorP,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [_title(context), Expanded(child: SaleForm())],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        "Nueva Venta",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
        textAlign: TextAlign.left,
      ),
    );
  }
}
