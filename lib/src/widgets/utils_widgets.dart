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


void conteDialogBottom(BuildContext context, Widget conteWidget) {
  final widthScreen = MediaQuery.of(context).size.width;
  final heightScreen = MediaQuery.of(context).size.height;
  final colorP = Theme.of(context).colorScheme.secondary;
  Color colorShadows = const Color.fromARGB(150, 198, 215, 226);
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    pageBuilder: (_, __, ___) {
      return Container(
        height: heightScreen,
        width: widthScreen,
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: colorP,
                      size: 30.0,
                    ),
                  )),
              conteWidget
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}