import 'package:loja_hasura/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _repository;
  HomeStoreBase(this._repository);

  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}
