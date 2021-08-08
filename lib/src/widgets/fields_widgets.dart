import 'package:flutter/material.dart';

class FieldInputCustom extends StatelessWidget {
  FieldInputCustom({
    @required this.hintTextC,
    this.typeInput = TextInputType.text,
    this.textNotVisible = false,
    @required this.labelTextInput,
    @required this.controllerField,
    this.focusNode,
  });

  final hintTextC;
  final typeInput;
  final labelTextInput;
  final textNotVisible;
  final controllerField;
  final focusNode;

  @override
  Widget build(BuildContext context) {
    final colorError = Theme.of(context).colorScheme.error;
    final colorPV = Theme.of(context).colorScheme.primaryVariant;
    return Container(
      padding: EdgeInsetsDirectional.only(top: 4.0, start: 10.0, end: 10.0),
      decoration: BoxDecoration(
          color: colorPV,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
              spreadRadius: 5.0,
            )
          ]),
      child: Column(children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            this.labelTextInput,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        TextFormField(
          controller: this.controllerField,
          focusNode: this.focusNode,
          style: TextStyle(color: Color.fromRGBO(119, 115, 115, 1)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0.0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintText: hintTextC,
            hintStyle: TextStyle(color: Color.fromRGBO(119, 115, 115, 1)),
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
        )
      ]),
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
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
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
