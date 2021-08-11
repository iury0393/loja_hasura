import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../text_styles.dart';

Future<dynamic> showNativeDialog<T>(
    {required BuildContext context, required WidgetBuilder builder}) {
  if (Platform.isIOS) {
    return showCupertinoDialog(barrierDismissible: true, context: context, builder: builder);
  } else {
    return showDialog(barrierDismissible: true, context: context, builder: builder);
  }
}

class NativeDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;
  final BuildContext ctx;

  NativeDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.actions,
    required this.ctx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? iosDialog() : androidDialog();
  }

  CupertinoAlertDialog iosDialog() {
    return CupertinoAlertDialog(
      title: _buildTitle(),
      content: _buildMessage(),
      actions: actions,
    );
  }

  AlertDialog androidDialog() {
    return AlertDialog(
      title: _buildTitle(),
      content: _buildMessage(),
      actions: actions,
    );
  }

  Text _buildTitle() {
    return Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Text _buildMessage() {
    return Text(
      message,
      style: TextStyle(fontSize: 14),
    );
  }

  static void showErrorDialog(BuildContext context, String message) {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: TextStyles.paragraph(
              TextSize.medium,
              weight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Text(
            message,
            style: TextStyles.paragraph(
              TextSize.small,
              weight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(
                'Ok',
                style: TextStyles.paragraph(
                  TextSize.medium,
                ),
              ),
              onPressed: () => Modular.to.pop(),
            )
          ],
        ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            'Error',
            style: TextStyles.paragraph(
              TextSize.medium,
              weight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Text(
            message,
            style: TextStyles.paragraph(
              TextSize.small,
              weight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyles.paragraph(
                  TextSize.medium,
                ),
              ),
              isDefaultAction: true,
              onPressed: () => Modular.to.pop(),
            )
          ],
        ),
      );
    }
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: Center(
            child: Platform.isIOS ? _iosLoading() : _androidLoading(),
          ),
        ),
      ),
    );
  }

  static _iosLoading() {
    return CupertinoActivityIndicator(
      animating: true, //animating,
    );
  }

  static _androidLoading() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey,
      ),
    );
  }
}
