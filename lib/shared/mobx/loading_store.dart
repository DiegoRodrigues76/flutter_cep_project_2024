import 'package:mobx/mobx.dart';

// Parte gerada automaticamente pelo MobX para gerar o código de observáveis e ações
part 'loading_store.g.dart';

// Define a classe LoadingStore, que usa o mixin do MobX para gerenciamento de estado reativo
class LoadingStore = _LoadingStore with _$LoadingStore;

// Classe abstrata para definir os observáveis e ações do MobX
abstract class _LoadingStore with Store {
  // Observável para indicar se algo está carregando ou não
  @observable
  bool isLoading = false;

  // Ação para atualizar o estado de carregamento
  @action
  void setLoading(bool value) {
    isLoading = value;
  }
}
