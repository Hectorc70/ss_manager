import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Text(
              'Nuevo Producto',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  _submitProduct() {
    if (_formKey.currentState!.validate()) {}
  }
}
