import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart';
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart';
import 'package:estudo_flutter/shared/mobx/loading_store.dart';
import 'package:estudo_flutter/shared/widgets/global_themes.dart';
import 'package:estudo_flutter/shared/widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Define a classe BuscaWidgets que fornece métodos para criar widgets utilizados na busca de CEP
class BuscaWidgets {
  // Instâncias de GlobalWidgets e ThemeColors 
  final GlobalWidgets widgets = GlobalWidgets();
  final ThemeColors themeColors = ThemeColors();
  
  // Instância de BuscaCepStore para gerenciar a lógica de busca de CEPs
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>();
  
  // Instância de LoadingStore para gerenciar o estado de carregamento
  final LoadingStore loadingStore = LoadingStore();

  // Método para construir um campo de entrada de texto para CEP
  // Recebe um TextEditingController e um texto de dica (hintText)
  Widget buildCepInput(TextEditingController controller, String hintText) {
    return SizedBox(
      width: 302,
      child: TextFormField(
        focusNode: FocusNode(),  // Cria um FocusNode para gerenciar o foco do campo
        autofocus: true,  // Define que o campo recebe foco automaticamente ao ser exibido
        controller: controller,  // Define o controlador do campo de texto
        style: widgets.textInputStyle,  // Define o estilo do texto do campo
        textInputAction: TextInputAction.done,  // Define a ação do botão de "enter" no teclado
        decoration: InputDecoration(
          hintText: hintText,  // Define o texto de dica (hint)
          hintStyle: widgets.textInputStyle,  // Define o estilo do texto de dica
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),  // Define o raio das bordas do campo
            borderSide: BorderSide(
              color: themeColors.greyWhite,  // Define a cor da borda quando o campo está habilitado
              width: 1,
            ),
          ),
          focusedBorder: widgets.outlineBorder,  // Define a borda do campo quando está em foco
          disabledBorder: widgets.outlineBorder,  // Define a borda do campo quando está desabilitado
          border: widgets.outlineBorder,  // Define a borda padrão do campo
          filled: true,  // Define que o campo será preenchido com uma cor de fundo
          fillColor: const Color(0XFFF6F6F6),  // Define a cor de fundo do campo
          isDense: true,  // Define que o campo será denso (compacto)
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,  // Define o preenchimento horizontal do conteúdo do campo
            vertical: 12,  // Define o preenchimento vertical do conteúdo do campo
          ),
        ),
      ),
    );
  }

  // Método para construir um botão de confirmação
  // Recebe uma função que será executada quando o botão for pressionado
  Widget confirmButton(Future<void> Function() confirmText) {
    return Container(
      width: double.maxFinite,  // Define que o botão terá largura máxima disponível
      height: 32,  // Define a altura do botão
      margin: const EdgeInsets.only(
        left: 30,
        right: 28,
      ),
      child: ElevatedButton(
        style: widgets.elevatedButtonStyle,  // Define o estilo do botão
        onPressed: () {
          confirmText();  // Executa a função passada quando o botão for pressionado
        },
        child: Text(
          "Buscar",  // Texto exibido no botão
          style: widgets.buttonTextStyle,  // Estilo do texto do botão
        ),
      ),
    );
  }

  // Método para construir widgets de seleção de estado e cidade
  // Recebe um controlador de texto, uma função de confirmação e uma instância de CidadeEstadoStore
  Widget buildEstadoCidadeSelecao(
    TextEditingController textController2,
    Future<void> Function() confirmText,
    CidadeEstadoStore buscaCepPageStore,
  ) {
    return FutureBuilder<List<Estado>>(
      future: _buscaCepStore.carregarEstadosCidades(),  // Carrega a lista de estados e cidades
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();  // Exibe um indicador de carregamento enquanto os dados são carregados
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');  // Exibe uma mensagem de erro se houver um problema ao carregar os dados
        } else if (snapshot.hasData) {
          List<Estado> estados = snapshot.data!;  // Obtém a lista de estados do snapshot
          return Column(
            children: [
              // Observer para observar as mudanças no estado selecionado
              Observer(
                builder: (_) => DropdownButton<String>(
                  hint: const Text(
                    "Selecione o Estado",  // Texto exibido quando nenhum estado está selecionado
                    style: TextStyle(color: Colors.black),
                  ),
                  value: buscaCepPageStore.estadoSelecionado,  // Valor do estado selecionado
                  onChanged: (newValue) {
                    buscaCepPageStore.setEstadoSelecionado(newValue);  // Atualiza o estado selecionado
                    buscaCepPageStore.setCidadeSelecionada(null);  // Reseta a cidade selecionada
                    buscaCepPageStore.setCidades(estados
                      .firstWhere((estado) => estado.sigla == newValue)
                      .cidades);  // Atualiza a lista de cidades com base no estado selecionado
                  },
                  items: estados.map<DropdownMenuItem<String>>((Estado estado) {
                    return DropdownMenuItem<String>(
                      value: estado.sigla,  // Define o valor da opção do dropdown
                      child: Text(estado.nome),  // Define o texto exibido na opção do dropdown
                    );
                  }).toList(),
                ),
              ),
              // Observer para observar as mudanças na cidade selecionada
              Observer(
                builder: (_) => DropdownButton<String>(
                  hint: const Text(
                    "Selecione a Cidade",  // Texto exibido quando nenhuma cidade está selecionada
                    style: TextStyle(color: Colors.black),
                  ),
                  value: buscaCepPageStore.cidades.isNotEmpty
                    ? buscaCepPageStore.cidadeSelecionada  // Valor da cidade selecionada
                    : null,
                  onChanged: buscaCepPageStore.cidades.isNotEmpty
                    ? (newValue) {
                      buscaCepPageStore.setCidadeSelecionada(newValue);  // Atualiza a cidade selecionada
                      print('${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/${textController2.text}');
                      Column(
                        children: [
                          buildCepInput(textController2, "Digite o Logradouro para a busca"),  // Exibe o campo de entrada para logradouro
                          const SizedBox(height: 10),
                          confirmButton(confirmText),  // Exibe o botão de confirmação
                        ],
                      );
                    }
                    : null,
                  items: buscaCepPageStore.cidades.map<DropdownMenuItem<String>>((String cidade) {
                    return DropdownMenuItem<String>(
                      value: cidade,  // Define o valor da opção do dropdown
                      child: Text(cidade),  // Define o texto exibido na opção do dropdown
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else {
          return const Text('No data found');  // Exibe uma mensagem se não houver dados
        }
      },
    );
  }
}
