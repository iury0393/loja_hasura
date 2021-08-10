import 'package:flutter_test/flutter_test.dart';
import 'package:loja_hasura/app/modules/home/qidgets/card_produto_store.dart';
 
void main() {
  late CardProdutoStore store;

  setUpAll(() {
    store = CardProdutoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}