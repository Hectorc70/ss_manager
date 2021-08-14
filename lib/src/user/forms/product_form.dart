import 'package:flutter/material.dart';
import 'package:ss_manager/src/widgets/buttons_widget.dart';
import 'package:ss_manager/src/widgets/fields_widgets.dart';

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
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    ButtonFormCancel(
                      textName: 'Cancelar',
                    ),
                    Expanded(child: SizedBox()),
                    ButtonFormOk(
                      textName: 'Guardar',
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  _submitProduct() {
    if (_formKey.currentState!.validate()) {}
  }
}
