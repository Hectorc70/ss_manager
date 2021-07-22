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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FieldInputCustom(
            controllerField: controllerName,
            hintTextC: '',
            typeInput: TextInputType.name,
            labelTextInput: 'Nombre de Producto',
          ),
          Row(children: [
            FieldInputMountCustom(
              controllerField: controllerMount,
              labelTextInput: 'Cantidad de Pzs',
              typeInput: TextInputType.number,
              widthForm: width * .30,
            ),
            Expanded(child: SizedBox()),
            FieldInputMountCustom(
              controllerField: controllerTotal,
              labelTextInput: 'Total',
              typeInput: TextInputType.number,
              widthForm: width * .30,
            ),
          ]),
          SizedBox(
            height: 30.0,
          ),
          _buttonsActionsForm()
        ],
      ),
    );
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
