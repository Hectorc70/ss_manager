import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_manager/src/autenticacion/providers/autenticacion_provider.dart';
import 'package:ss_manager/src/autenticacion/providers/user_provider.dart';
import 'package:ss_manager/src/user/providers/products_provider.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';
import 'package:ss_manager/src/widgets/utils_widgets.dart';

class ProductForm extends StatefulWidget {
  ProductForm({Key? key}) : super(key: key);

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
    super.initState();
    controllerMount.text = '0.0';
    controllerPieces.text = '0';
  }

  void dispose() {
    controllerName.dispose();
    controllerMount.dispose();
    controllerPieces.dispose();
    super.dispose();
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
                  hintTextC: 'Paleta',
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
                      functionAction: _submitProduct,
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
    Navigator.of(context).pop();
  }

  _submitProduct(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final products = Provider.of<ProductsProvider>(context, listen: false);
      final user = Provider.of<UserProvider>(context, listen: false);
      final resp = await products.newProduct(user.userData);

      if (resp[0] == 0) {
        messageOk('Producto Creado', 2);
      } else {
        messageError(resp[1], 2);
      }
    }
  }
}
