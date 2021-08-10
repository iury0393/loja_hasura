import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String title;
  const CardProdutoWidget({Key? key, this.title = 'CardProdutoWidget'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
