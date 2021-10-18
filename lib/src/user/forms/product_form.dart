import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/user/models/product_model.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class ProductForm extends StatefulWidget {
  ProductForm({this.type, Key? key}) : super(key: key);

  final type;
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controllerName = TextEditingController();
  final controllerPieces = TextEditingController();
  final controllerMount = TextEditingController();

  @override
  void initState() {
    _loadData().then((value) => null);
    super.initState();
  }

  void dispose() {
    controllerName.dispose();
    controllerMount.dispose();
    controllerPieces.dispose();
    super.dispose();
  }

  Future _loadData() async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final select = products.selectProduct;
    if (select.name != null) {
      controllerName.text = select.name;
      controllerMount.text = select.price;
      controllerPieces.text = select.pieces;
    } else {
      controllerMount.text = '0.0';
      controllerPieces.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Nuevo Producto',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FieldInputCustom(
                  labelTextInput: 'Nombre Producto',
                  hintTextC: 'Escribe el Nombre',
                  controllerField: controllerName,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FieldInputMountCustom(
                  controllerField: controllerMount,
                  labelTextInput: 'Precio de Producto',
                  functionAdd: _addMount,
                  functionRemove: _removeMount,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FieldInputMountCustom(
                  controllerField: controllerPieces,
                  labelTextInput: 'Piezas de Producto',
                  functionAdd: _addPiece,
                  functionRemove: _removePiece,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    ButtonFormCancel(
                      textName: 'Cancelar',
                      functionAction: _cancel,
                    ),
                    Expanded(child: SizedBox()),
                    ButtonFormOk(
                      textName: 'Guardar',
                      functionAction: _validate,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  _addMount(BuildContext context) {
    final mount = controllerMount.text;
    double mountF = double.parse(mount);
    mountF = mountF + 1;
    controllerMount.text = mountF.toString();
  }

  _removeMount(BuildContext context) {
    final mount = controllerMount.text;
    double mountF = double.parse(mount);

    if (mountF > 0.0) {
      mountF = mountF - 1;

      controllerMount.text = mountF.toString();
    }
  }

  _addPiece(BuildContext context) {
    final mount = controllerPieces.text;
    int mountF = int.parse(mount);
    mountF = mountF + 1;
    controllerPieces.text = mountF.toString();
  }

  _removePiece(BuildContext context) {
    final mount = controllerPieces.text;
    int mountF = int.parse(mount);
    if (mountF > 0) {
      mountF = mountF - 1;
      controllerPieces.text = mountF.toString();
    }
  }

  _cancel() {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    products.selectProduct = ProductModel();
    Navigator.of(context).pop();
  }

  _validate(BuildContext context) async {
    if (widget.type == 'edit') {
      await _editProduct(context);
    } else {
      await _submitProduct(context);
    }
  }

  _submitProduct(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final products = Provider.of<ProductsProvider>(context, listen: false);
      final user = Provider.of<UserProvider>(context, listen: false);

      ProductModel productNew = ProductModel.fromJson({
        'name': controllerName.text,
        'price': controllerMount.text,
        'pieces': controllerPieces.text,
        'user': user.userData.id
      }, 'id');

      products.dataNewProduct = productNew;
      final resp = await products.newProduct();

      if (resp[0] == 0) {
        Navigator.of(context).pop();
        messageOk('Producto Creado', 2);
      } else {
        messageError(resp[1], 2);
      }
    }
  }

  Future _editProduct(BuildContext context) async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final user = Provider.of<UserProvider>(context, listen: false);

    if (products.selectProduct.idDocument != null) {
      Map<String, dynamic> data = {
        'name': controllerName.text,
        'price': controllerMount.text,
        'pieces': controllerPieces.text,
      };
      loaderView(context);
      await products.editProduct(products.selectProduct.idDocument, data);
      Loader.hide();

      loaderView(context);
      final resp = await products.getProducts(user.userData.id);
      Loader.hide();
      if (resp[0] == 1) {
        final data = resp[1].items;
        products.productsDB = data;
        products.productsDBMap = resp[1].products;
        products.productsSelect = resp[1].itemsSelect;
      } else {
        messageError(resp[1].toString(), 2);
      }
      Navigator.of(context).pop();
      //products.selectProduct = ProductModel();
    }
  }
}
