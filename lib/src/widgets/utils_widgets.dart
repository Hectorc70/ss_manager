import 'package:flutter/material.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

messageError( String msg, int seconds) {

  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: seconds,
      backgroundColor: Color.fromRGBO(74, 9, 6, 10),
      textColor: Colors.white,
      fontSize: 18.0);
}

loaderView(BuildContext context) {
  final colorP = Theme.of(context).colorScheme.secondaryVariant;
  Loader.show(context,
      overlayColor: Color.fromRGBO(248, 249, 249, 250),
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: 7.0,
        color: colorP,
      ));
}
