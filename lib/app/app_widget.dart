import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Hasura',
      theme: ThemeData(primaryColor: Color(0xFF797EC2), accentColor: Color(0xFF72AFDD)),
    ).modular();
  }
}
