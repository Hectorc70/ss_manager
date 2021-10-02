import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
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
    final width = MediaQuery.of(context).size.width;
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
                  controllerField: controllerName,
                  typeDrop: SelectFormFieldType.dialog,
                  labelTextInput: 'Nombre de Producto',
                  items: [
                    {'value': '', 'label': 'sfsd'}
                  ],
                ),
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

  _add(BuildContext context) {}

  _addPiece(BuildContext context) {
    final total = controllerTotal.text;
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
    if (_formKey.currentState!.validate()) {}
  }

  _cancelAction(BuildContext context) {}
}
