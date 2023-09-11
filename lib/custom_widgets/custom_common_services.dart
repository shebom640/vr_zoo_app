import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

import 'custom_color.dart';

void customToast(BuildContext context, String text,
    {Color? backgroundColor, int? duration, Color? textColor}) {
  FocusManager.instance.primaryFocus?.unfocus();
  if (text.isNotEmpty) {
    showToast(
      context: context,
      padding: EdgeInsets.zero,
      alignment: const Alignment(0, 1),
      duration: Duration(seconds: duration ?? 3),
      animationDuration: const Duration(milliseconds: 250),
      animationBuilder: (context, animation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )),
          child: child,
        );
      },
      child: Dismissible(
        key: const ValueKey<String>('Snackbar'),
        direction: DismissDirection.down,
        child: Material(
          // elevation: Theme.of(context).snackBarTheme.elevation ?? 6.0,
          color: CustomColor.primary,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: backgroundColor ?? CustomColor.primary,
            child: CustomText(
              text,
              color: textColor ?? Colors.white,
              fontSize: FontSizes.s16,
              fontWeight: FontWeight.w500,
              maxLines: 3,
            ),
          ),
        ),
      ),
    );
  }
}

Widget customTextLabel(String text, {double? paddingAll, Color? color, Color? textColor, EdgeInsets? margin}){
  return Container(
    width: double.maxFinite,
    color: color ?? CustomColor.textColorPrimary,
    margin: margin ?? EdgeInsets.only(top: 12, bottom: 5),
    padding: EdgeInsets.all(paddingAll??12),
    child: CustomText(text, fontSize: FontSizes.s16, color: textColor,),
  );
}

Future confirmAlert(BuildContext context,{String? header, String? body, String? yesText, String? noText}){
  AlertDialog alert = AlertDialog(
    contentPadding: const EdgeInsets.only(left: 15, right: 15,),
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    title: CustomText(header ?? "", textAlign: TextAlign.left, fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.primary,),
    titlePadding: EdgeInsets.only(top: header==""?0:20, bottom: header==""?0:20, left: 15, right: 15),
    content: CustomText(body ?? "", textAlign: TextAlign.left, fontSize: 16, color: Colors.grey.shade800,),
    actions: <Widget> [
      TextButton(
          child: CustomText(noText ?? "No", fontSize: 16, fontWeight: FontWeight.w500, color: CustomColor.border,),
          onPressed: ()=>Navigator.of(context).pop(false)),
      TextButton(child: CustomText(yesText ?? "Yes", fontSize: 16, fontWeight: FontWeight.w500, color: CustomColor.primary,),
          onPressed: ()=>Navigator.of(context).pop(true))
    ],
  );

  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      }
  );
}

bool isMobile(context) => MediaQuery.of(context).size.width <= 600;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;