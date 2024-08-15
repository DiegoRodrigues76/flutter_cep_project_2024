import 'package:mobx/mobx.dart';

// Parte gerada automaticamente pelo MobX para gerar o código de observáveis e ações
part 'cidade_estado_store.g.dart';

// Define a classe CidadeEstadoStore, que usa o mixin do MobX para gerenciamento de estado reativo
class CidadeEstadoStore = _CidadeEstadoStore with _$CidadeEstadoStore;

// Classe abstrata para definir os observáveis e ações do MobX
abstract class _CidadeEstadoStore with Store {
  // Observável para armazenar o estado selecionado
  @observable
  String? estadoSelecionado;

  // Observável para armazenar a cidade selecionada
  @observable
  String? cidadeSelecionada;

  // Observável para armazenar a lista de cidades
  @observable
  List<String> cidades = [];

  // Ação para atualizar o estado selecionado
  @action
  void setEstadoSelecionado(String? novoEstado) {
    estadoSelecionado = novoEstado;
  }

  // Ação para atualizar a cidade selecionada
  @action
  void setCidadeSelecionada(String? novaCidade) {
    cidadeSelecionada = novaCidade;
  }

  // Ação para atualizar a lista de cidades
  @action
  void setCidades(List<String> novasCidades) {
    cidades = novasCidades;
  }
}
