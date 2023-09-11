import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as ModalSheet;

Future<dynamic> pushPage(BuildContext context, pageName, {bool? maintainState}) async {
  var response = await Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => pageName,
        maintainState: maintainState ?? true
    ),

  );
  return response;
}

Future setRootPage(BuildContext context, Widget pageName, {bool? maintainState}) async {
  var response = await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => pageName,
          maintainState: maintainState ?? true),
          (Route<dynamic> route) => false);
  return response;
}
