import 'package:mobx/mobx.dart';

part 'card_produto_store.g.dart';

class CardProdutoStore = _CardProdutoStoreBase with _$CardProdutoStore;
abstract class _CardProdutoStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}