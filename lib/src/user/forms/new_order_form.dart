
import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  @override
  OrderFormState createState() {
    return OrderFormState();
  }
}

class OrderFormState extends State<OrderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('context'),
          
        ],
      ),
    );
  }

  _form(){
    
  }
}