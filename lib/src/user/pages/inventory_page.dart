import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/user/forms/product_form.dart';
import 'package:ss_manager/src/user/models/product_model.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/laoders_data_widget.dart';
import 'package:ss_manager/src/widgets/main_lateral.dart';
import 'package:ss_manager/src/widgets/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
import 'package:ss_manager/src/widgets/widgets_body.dart';

class InventoryPage extends StatefulWidget {
  InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    _loadData().then((value) {
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final colorP = Theme.of(context).primaryColor;
    final colorSecond = Theme.of(context).colorScheme.secondary;

    if (isLoading) {
      return WillPopScope(
          child: Scaffold(
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
              ),
              body: Stack(children: [
                Container(
                  color: colorP,
                  height: heightScreen,
                ),
                BodyCustomWidget(
                  childWidget: _BodyLoader(),
                  heightW: heightScreen,
                  widthtW: widthScreen,
                  paddingW: EdgeInsets.all(35.0),
                )
              ]),
              bottomNavigationBar: BottomNavBarCustom()),
          onWillPop: () {
            return new Future(() => false);
          });
    } else {
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
                paddingW: EdgeInsets.all(0.0),
              )
            ]),
            bottomNavigationBar: BottomNavBarCustom(),
          ),
          onWillPop: () {
            return new Future(() => false);
          });
    }
  }

  Future _loadData() async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);

    setState(() {
      isLoading = true;
    });

    final resp = await products.getProducts(user.userData.id);

    if (resp[0] == 1) {
      final data = resp[1];
      products.productsDB = data;
    } else {
      messageError(resp[1].toString(), 2);
    }

    setState(() {
      isLoading = false;
    });
  }
}

class _BodyLoader extends StatelessWidget {
  const _BodyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(40.0),
      children: [
        ShimmerCustom.rectangular(
          height: 20.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        ShimmerCustom.rectangular(
          height: 60.0,
          width: 160.0,
        )
      ],
    );
  }
}

class _BodyInventory extends StatefulWidget {
  const _BodyInventory({Key? key}) : super(key: key);

  @override
  State<_BodyInventory> createState() => _BodyInventoryState();
}

class _BodyInventoryState extends State<_BodyInventory> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final colorIcons = const Color.fromRGBO(193, 199, 255, 1);

    if (products.productsDB.length == 0) {
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
            Center(
              child: RefreshIndicator(
                  onRefresh: () async {
                    await _loadData();
                  },
                  child: Text('Sin Productos')),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            NameSection(
              textW: 'Mis Productos',
              childWidget: ButtonTitleAdd(
                functionAction: _addNewProduct,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: RefreshIndicator(
                  onRefresh: () async {
                    await _loadData();
                  },
                  child: ListView.builder(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                      itemCount: products.productsDB.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardItem(
                          heightWidget: 80.0,
                          iconCard: ManagerIcons.products,
                          colorIconConte: colorIcons,
                          pieces: products.productsDB[index].pieces,
                          nameProduct: products.productsDB[index].name,
                          price: products.productsDB[index].price,
                          functionAction: _viewDetail,
                        );
                      })),
            )
          ],
        ),
      );
    }
  }

  Future _loadData() async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);

    final resp = await products.getProducts(user.userData.id);

    if (resp[0] == 1) {
      final data = resp[1];
      products.productsDB = data;
    } else {
      messageError(resp[1].toString(), 2);
    }
  }

  _addNewProduct(BuildContext context) async {
    conteDialogBottom(context, ProductForm());
  }

  _viewDetail(BuildContext context) {}
}
