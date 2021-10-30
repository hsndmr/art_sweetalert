import 'package:art_sweetalert/src/art_dialog.dart';
import 'package:flutter/material.dart';

enum ArtSweetAlertType { success, warning, danger, question, info }

class ArtSweetAlert {
  static show(
      {
        required BuildContext context,
        bool barrierDismissible = true,
        required ArtDialogArgs artDialogArgs,
        GlobalKey? artDialogKey
      }) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ArtDialog(
          key: artDialogKey ?? null,
          artDialogArgs: artDialogArgs,
        );
      },
      barrierDismissible: barrierDismissible,
      barrierColor: artDialogArgs.barrierColor,
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          alignment: Alignment.center,
          scale: CurvedAnimation(
            parent: animation,
            curve: Interval(
              0.00,
              1.0,
              curve: Curves.easeInOutBack,
            ),
          ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
            child: child,
          ),
        );
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );
  }
}
