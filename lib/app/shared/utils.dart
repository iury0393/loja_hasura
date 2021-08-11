import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static showLoading(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Platform.isIOS ? _iosLoading() : _androidLoading(context),
      ),
    );
  }

  static _iosLoading() {
    return CupertinoActivityIndicator(
      animating: true, //animating,
    );
  }

  static _androidLoading(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}
