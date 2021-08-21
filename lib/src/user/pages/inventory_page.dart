import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/user/forms/product_form.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/widgets/bottom_nav_widget.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/main_lateral.dart';
import 'package:ss_manager/src/widgets/manager_icons_icons.dart';
import 'package:ss_manager/src/widgets/page_widget.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';
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
    final colorIcons = const Color.fromRGBO(193, 199, 255, 1);
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
          Expanded(child: RefresProducts()),
        ],
      ),
    );
  }

  _addNewProduct(BuildContext context) async {
    conteDialogBottom(context, ProductForm());
  }
}

class RefresProducts extends StatefulWidget {
  RefresProducts({Key? key}) : super(key: key);

  @override
  _RefresProductsState createState() => _RefresProductsState();
}

class _RefresProductsState extends State<RefresProducts> {
  List<dynamic> _products = [];
  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final colorIcons = const Color.fromRGBO(193, 199, 255, 1);
    return RefreshIndicator(
        onRefresh: () {
          return _getProducts();
        },
        child: ListView.builder(
            itemCount: _products.length,
            itemBuilder: (BuildContext context, int index) {
              return CardItem(
                heightWidget: 80.0,
                iconCard: ManagerIcons.products,
                colorIconConte: colorIcons,
                pieces: _products[index]['pieces'],
                nameProduct: _products[index]['name'],
                price: _products[index]['price'],
                functionAction: _viewDetail,
              );
            }));
  }

  _viewDetail() {}
  Future _getProducts() async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    await products.getProducts().then((value) {
      setState(() {
        if (value[0] == 0) {
          _products = value[1];
        }
      });
    });
  }
}
