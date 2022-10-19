import 'package:fashionizt/Data/db_helper_user.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../routes.dart';
import '../shared_preferences.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static final PrefService _prefService = PrefService();
  static DbHelperUser db = DbHelperUser();

  static Future<DialogsAction> yesCancelDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: blacksand, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () async {
                await db.clearUser();
                await PrefService.removeCache("username").then((value) {
                  print('username : ' + value.toString());
                  Navigator.of(context).pushNamed(LoginRoute);
                });
              },
              child: Text(
                'Confirm',
                style: TextStyle(
                    color: blacksand, fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },);
    return (action != null) ? action : DialogsAction.cancel;
  }
}