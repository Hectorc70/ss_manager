import 'package:flutter/material.dart';

class FieldInputCustom extends StatelessWidget {
  FieldInputCustom({
    @required this.hintTextC,
    this.typeInput = TextInputType.text,
    this.textNotVisible = false,
    @required this.labelTextInput,
  });

  final hintTextC;
  final typeInput;
  final labelTextInput;
  final textNotVisible;

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 0.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: labelTextInput,
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: hintTextC,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    
                  ),
                  obscureText: textNotVisible,
                  keyboardType: typeInput,
                  );
  }
}