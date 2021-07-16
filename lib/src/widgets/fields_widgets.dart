import 'package:flutter/material.dart';

class FieldInputCustom extends StatelessWidget {
  FieldInputCustom({
    @required this.hintTextC,
    this.typeInput = TextInputType.text,
    this.textNotVisible = false,
    @required this.labelTextInput,
    @required this.controllerField,
  });

  final hintTextC;
  final typeInput;
  final labelTextInput;
  final textNotVisible;
  final controllerField;

  @override
  Widget build(BuildContext context) {
    final colorError = Theme.of(context).colorScheme.error;
    return TextFormField(
      controller: this.controllerField,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 0.0),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelText: labelTextInput,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintTextC,
        hintStyle: TextStyle(color: Colors.grey[400]),
        errorStyle: TextStyle(color: colorError),
      ),
      obscureText: textNotVisible,
      keyboardType: typeInput,
      validator: (value) {
        if (value == '' || value == null) {
          return 'Ingrese datos en campo';
        }

        return null;
      },
    );
  }
}

class FieldInputMountCustom extends StatelessWidget {
  FieldInputMountCustom({
    this.typeInput = TextInputType.number,
    @required this.labelTextInput,
    @required this.controllerField,
    this.widthForm,
  });

  final typeInput;
  final labelTextInput;
  final widthForm;
  final controllerField;

  @override
  Widget build(BuildContext context) {
    final colorError = Theme.of(context).colorScheme.error;
    return Container(
      width: widthForm,
        child: TextFormField(
      controller: this.controllerField,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 0.0),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelText: labelTextInput,
        labelStyle: TextStyle(color: Colors.white),
        errorStyle: TextStyle(color: colorError),
      ),
      keyboardType: typeInput,
      validator: (value) {
        if (value == '' || value == null) {
          return 'Ingrese datos en campo';
        }

        return null;
      },
    ));
  }
}
