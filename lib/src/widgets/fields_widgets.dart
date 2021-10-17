import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

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
                color: Colors.grey.shade500,
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
    this.hintTextC,
    this.typeInput = TextInputType.number,
    @required this.labelTextInput,
    @required this.controllerField,
    @required this.functionAdd,
    @required this.functionRemove,
    this.enabled = true,
    this.widthForm,
  });

  final enabled;
  final hintTextC;
  final typeInput;
  final labelTextInput;
  final widthForm;
  final controllerField;
  final functionAdd;
  final functionRemove;

  @override
  Widget build(BuildContext context) {
    final colorError = Theme.of(context).colorScheme.error;
    final colorPV = Theme.of(context).colorScheme.primaryVariant;
    final widthScreen = MediaQuery.of(context).size.width;
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
            labelTextInput,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          children: [
            IconButton(
                alignment: AlignmentDirectional.centerStart,
                color: Color.fromRGBO(119, 115, 115, 1),
                iconSize: 25.0,
                onPressed: () async {
                  functionAdd(context);
                },
                icon: Icon(Icons.add)),
            Container(
              width: widthScreen * .15,
              alignment: AlignmentDirectional.center,
              child: TextFormField(
                controller: controllerField,
                style: TextStyle(
                  color: Color.fromRGBO(119, 115, 115, 1),
                ),
                textAlign: TextAlign.center,
                enabled: enabled,
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 0.0),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  hintText: hintTextC,
                  hintStyle: TextStyle(color: Color.fromRGBO(119, 115, 115, 1)),
                  errorStyle: TextStyle(color: colorError),
                ),
                keyboardType: typeInput,
                validator: (value) {
                  if (value == '0' || value == '0.0') {
                    return 'El monto no puede ser 0';
                  }

                  return null;
                },
              ),
            ),
            IconButton(
                alignment: AlignmentDirectional.centerStart,
                color: Color.fromRGBO(119, 115, 115, 1),
                iconSize: 25.0,
                onPressed: () async {
                  functionRemove(context);
                },
                icon: Icon(Icons.remove))
          ],
        )
      ]),
    );
  }
}

class FieldSelectForm extends StatelessWidget {
  FieldSelectForm(
      {@required this.hintTextC,
      @required this.labelTextInput,
      @required this.controllerField,
      @required this.items,
      this.functionOnChanged,
      this.typeDrop = SelectFormFieldType.dialog,
      Key? key})
      : super(key: key);

  final hintTextC;
  final labelTextInput;
  final controllerField;
  final functionOnChanged;
  final items;
  SelectFormFieldType typeDrop;

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
                  color: Colors.grey.shade500,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SelectFormField(
              onChanged: (value) async {
                await functionOnChanged(context, value);
              },
              hintText: hintTextC,
              dialogCancelBtn: 'Cancelar',
              dialogTitle: labelTextInput,
              dialogSearchHint: 'Buscar',
              enableSearch: true,
              type: typeDrop,
              style: TextStyle(
                color: Color.fromRGBO(119, 115, 115, 1),
              ),
              decoration: InputDecoration(border: InputBorder.none),
              items: items)
        ]));
  }
}
