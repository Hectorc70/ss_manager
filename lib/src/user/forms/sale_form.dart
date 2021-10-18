import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/user/models/sales_model.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/user/providers/sales_provider.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class SaleForm extends StatefulWidget {
  @override
  SaleFormState createState() {
    return SaleFormState();
  }
}

class SaleFormState extends State<SaleForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerMount = TextEditingController();
  final controllerPieces = TextEditingController();
  final controllerTotal = TextEditingController();

  @override
  void initState() {
    super.initState();

    controllerMount.text = '0.0';
    controllerPieces.text = '1';
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerPieces.dispose();
    controllerMount.dispose();
    controllerTotal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return Material(
        child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child: Column(children: [
                Text(
                  'Nueva Venta',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FieldSelectForm(
                    hintTextC: 'Selecciona un Producto',
                    functionOnChanged: _loadDataProduct,
                    controllerField: controllerName,
                    typeDrop: SelectFormFieldType.dialog,
                    labelTextInput: 'Nombre de Producto',
                    items: products.productsSelect),
                SizedBox(height: 10.0),
                FieldInputMountCustom(
                  controllerField: controllerMount,
                  labelTextInput: 'Precio de Producto',
                  enabled: false,
                  functionAdd: _add,
                  functionRemove: _add,
                ),
                SizedBox(height: 10.0),
                FieldInputMountCustom(
                  controllerField: controllerPieces,
                  labelTextInput: 'Piezas',
                  functionAdd: _addPiece,
                  functionRemove: _removePiece,
                ),
                SizedBox(
                  height: 10.0,
                ),
                FieldInputCustom(
                  labelTextInput: 'Monto Total',
                  controllerField: controllerTotal,
                  hintTextC: 'Producto',
                  typeInput: TextInputType.number,
                ),
                SizedBox(
                  height: 30.0,
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
                      functionAction: _submitProduct,
                    ),
                  ],
                )
              ]),
            )));
  }

  Future _loadDataProduct(BuildContext context, value) async {
    final products = Provider.of<ProductsProvider>(context, listen: false);
    final prodSelect = products.productsDBMap[value];

    controllerMount.text = prodSelect!.price;
    final total =
        double.parse(prodSelect.price) * int.parse(controllerPieces.text);
    controllerTotal.text = total.toString();
  }

  _add(BuildContext context) {}

  _addPiece(BuildContext context) {
    final price = controllerMount.text;
    final mount = controllerPieces.text;
    int mountF = int.parse(mount);
    mountF = mountF + 1;
    final newTotal = double.parse(price) * mountF;
    controllerPieces.text = mountF.toString();
    controllerTotal.text = newTotal.toString();
  }

  _removePiece(BuildContext context) {
    final mount = controllerPieces.text;
    final price = controllerMount.text;
    int mountF = int.parse(mount);
    if (mountF > 1) {
      mountF = mountF - 1;
      final newTotal = double.parse(price) * mountF;
      controllerPieces.text = mountF.toString();
      controllerTotal.text = newTotal.toString();
    }
  }

  _cancel() {
    Navigator.of(context).pop();
  }

  _submitProduct(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final user = Provider.of<UserProvider>(context, listen: false);
      final sale = Provider.of<SaleProvider>(context, listen: false);
      final products = Provider.of<ProductsProvider>(context, listen: false);

      SaleModel newSale = SaleModel.fromJson({
        'product': products.productsDBMap[controllerName.text]?.name,
        'idProduct': controllerName.text,
        'pieces': controllerPieces.text,
        'total': controllerTotal.text,
        'idUser': user.userData.id,
      }, 'id');

      if (int.parse(controllerPieces.text) <=
          int.parse(products.productsDBMap[controllerName.text]?.pieces)) {
        sale.dataNewSale = newSale;
        loaderView(context);
        final resp = await sale.newSale();
        final respEdit = await products.editProduct(
            products.productsDBMap[controllerName.text]?.idDocument,
            products.productsDBMap[controllerName.text]?.pieces,
            controllerPieces.text);
        Loader.hide();
        if (resp[0] == 1) {
          Navigator.of(context).pop();
          messageOk('Venta Realizada', 2);
        } else {
          messageError(resp[1], 2);
        }
      } else {
        messageError(
            'Solo puedes Vender ${products.productsDBMap[controllerName.text]?.pieces} o menos',
            2);
      }
    }
  }

  _cancelAction(BuildContext context) {
    Navigator.of(context).pop();
  }
}
