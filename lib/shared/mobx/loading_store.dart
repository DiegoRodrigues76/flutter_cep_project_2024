import 'package:mobx/mobx.dart'; 
// Importa a biblioteca MobX, que é usada para gerenciamento de estado reativo

part 'loading_store.g.dart'; 
// Informa ao compilador que o código gerado automaticamente, a partir do arquivo 'loading_store.g.dart', deve ser incluído aqui

class LoadingStore = _LoadingStore with _$LoadingStore; 
// Define a classe `LoadingStore` como uma combinação da classe `_LoadingStore` com o mixin `_$LoadingStore`.
// O mixin é gerado automaticamente pelo MobX e adiciona funcionalidades reativas

abstract class _LoadingStore with Store { 
  // Define a classe `_LoadingStore` como uma classe abstrata que usa o mixin `Store` do MobX

  @observable
  bool isLoading = false; 
  // Declara uma variável observável `isLoading`. Esta variável pode ser observada por partes da UI, permitindo a atualização reativa com base em seu valor

  @action
  void setLoading(bool value) {
    isLoading = value; 
    // Define um método `setLoading`, que é uma ação anotada com `@action`. Este método altera o valor da variável `isLoading`.
    // A anotação `@action` indica que esta função irá modificar o estado observável, permitindo que o MobX trate essas alterações de maneira eficiente
  }
}
