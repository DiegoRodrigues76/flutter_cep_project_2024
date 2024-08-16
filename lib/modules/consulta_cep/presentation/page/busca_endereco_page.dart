import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart'; // Importa a loja de busca de CEP
import 'package:estudo_flutter/modules/consulta_cep/presentation/widgets/busca_widgets.dart'; // Importa widgets específicos para busca
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart'; // Importa a loja de cidade e estado
import 'package:estudo_flutter/shared/mobx/loading_store.dart'; // Importa a loja de carregamento
import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter
import 'package:flutter_mobx/flutter_mobx.dart'; // Importa o pacote para integração do MobX com o Flutter
import 'package:estudo_flutter/shared/widgets/global_themes.dart'; // Importa temas globais
import 'package:estudo_flutter/shared/widgets/global_widgets.dart'; // Importa widgets globais
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote para modularização do Flutter

// Define a página para busca de logradouro
class BuscaEnderecoPage extends StatefulWidget {
  const BuscaEnderecoPage({super.key}); // Construtor da página com chave opcional
  @override
  _BuscaEnderecoPageState createState() => _BuscaEnderecoPageState(); // Cria o estado da página
}

final GlobalWidgets widgets = GlobalWidgets(); // Instância dos widgets globais
final ThemeColors themeColors = ThemeColors(); // Instância dos temas globais

class _BuscaEnderecoPageState extends State<BuscaEnderecoPage> {
  final loadingStore = LoadingStore(); // Instância da loja de carregamento
  final TextEditingController _textController2 = TextEditingController(); // Controlador de texto para o campo de entrada
  final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore(); // Instância da loja de cidade e estado
  BuscaWidgets buscaWidgets = BuscaWidgets(); // Instância dos widgets específicos para busca
  List<String> _displayText = []; // Lista de textos a serem exibidos
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>(); // Instância da loja de busca de CEP obtida através do Modular
  List<String> _historico = []; // Lista para armazenar os endereços salvos

  // Função para confirmar o texto e buscar o Endereço
  Future<void> _confirmText() async {
    loadingStore.isLoading = true; // Define que está carregando
    String cep = _textController2.text; // Obtém o texto do controlador
    cep = '${buscaCepPageStore.estadoSelecionado}/${buscaCepPageStore.cidadeSelecionada}/$cep'; // Formata o CEP com estado e cidade selecionados
    print('https://viacep.com.br/ws/$cep/json/'); // Imprime a URL para debug
    try {
      final List<String> cepTextList = await _buscaCepStore.getList(cep); // Obtém a lista de logradouros da loja de busca de CEP
      await Future.delayed(const Duration(seconds: 1)); // Aguarda um segundo

      setState(() {
        loadingStore.isLoading = false; // Define que não está mais carregando
        _displayText = cepTextList; // Atualiza a lista de textos a serem exibidos
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2)); // Aguarda dois segundos em caso de erro
      setState(() {
        loadingStore.isLoading = false; // Define que não está mais carregando
        _displayText = ['Erro ao fazer a requisição. Detalhes: $e']; // Atualiza a lista de textos com mensagem de erro
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Busca de CEP'), // Título da barra de título
          leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.pop();
           },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: themeColors.white, // Define a cor de fundo da página
        resizeToAvoidBottomInset: false, // Impede o redimensionamento da página ao abrir o teclado
        body: Container(
          width: double.maxFinite, // Define a largura do container
          padding: const EdgeInsets.only(
            left: 36, // Margem esquerda
            top: 62, // Margem superior
            right: 36, // Margem direita
          ),
          child: Column(
            children: [
              Text(
                "Buscar por Endereços", // Título da página
                style: widgets.titleStyle, // Estilo do título
              ),
              const SizedBox(height: 86), // Espaçamento
              buscaWidgets.buildEstadoCidadeSelecao(_textController2, _confirmText, buscaCepPageStore), // Widget para seleção de estado e cidade
              Observer(
                builder: (_) {
                  if (buscaCepPageStore.cidadeSelecionada != null) { // Verifica se a cidade foi selecionada
                    return Column(
                      children: [
                        buscaWidgets.buildCepInput(_textController2, "Digite o Logradouro para a busca"), // Campo de entrada para o logradouro
                        const SizedBox(height: 10), // Espaçamento
                        buscaWidgets.confirmButton(_confirmText), // Botão de confirmação
                      ],
                    );
                  } else {
                    return Container(); // Retorna um container vazio se a cidade não for selecionada
                  }
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _displayText.length, // Número de itens na lista
                  itemBuilder: (context, index) {
                    // Retorna um Card que contém um ListTile para cada item da lista 
                    return Card(
                      child: ListTile(
                        // O título do ListTile exibe o texto do item atual da lista _displayText
                        title:Text(_displayText[index]),
                        // Botão de ícone à direita do ListTile, com um ícone de salvar
                        trailing: IconButton(
                          icon: Icon(Icons.save),
                          // Ação executada ao pressionar o botão de salvar
                          onPressed: () {
                            // Adiciona o item atual ao histórico
                            _historico.add(_displayText[index]);
                            // Exibe uma SnackBar informando que o item foi salvo no histórico
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Endereço salvo no histórico')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
