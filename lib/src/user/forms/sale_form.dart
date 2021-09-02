import 'package:flutter/material.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';

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
  final controllerTotal = TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
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
                FieldInputCustom(
                  labelTextInput: 'Nombre de Producto',
                  controllerField: controllerName,
                  hintTextC: 'Producto',
                  typeInput: TextInputType.name,
                ),
                SizedBox(height: 15.0),
                FieldInputCustom(
                  labelTextInput: 'Piezas',
                  controllerField: controllerName,
                  hintTextC: 'Producto',
                  typeInput: TextInputType.number,
                ),
                SizedBox(height: 15.0),
                FieldInputCustom(
                  labelTextInput: 'Monto Total',
                  controllerField: controllerName,
                  hintTextC: 'Producto',
                  typeInput: TextInputType.number,
                ),
                FieldInputCustom(
                  labelTextInput: 'Monto Total',
                  controllerField: controllerName,
                  hintTextC: 'Producto',
                  typeInput: TextInputType.number,
                ),
                SizedBox(
                  height: 30.0,
                ),
              ]),
            )));
  }

  _buttonsActionsForm() {
    final colorPrimary = Theme.of(context).primaryColor;
    final colorSecond = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        ButtonCustomForm(
          textName: 'Cancelar',
          colorBtn: colorSecond,
          functionAction: _cancelAction,
          width: 150.0,
        ),
        Expanded(child: SizedBox()),
        ButtonCustomForm(
          textName: 'Guardar',
          colorBtn: colorPrimary,
          functionAction: _cancelAction,
          width: 150.0,
        ),
      ],
    );
  }

  _cancelAction(BuildContext context) {}
}
