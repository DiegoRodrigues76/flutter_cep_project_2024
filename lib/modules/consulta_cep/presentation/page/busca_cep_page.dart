import 'package:estudo_flutter/modules/consulta_cep/presentation/stores/busca_cep_store.dart'; // Importa a loja de busca de CEP
import 'package:estudo_flutter/modules/consulta_cep/presentation/widgets/busca_widgets.dart'; // Importa os widgets específicos para a busca de CEP
import 'package:estudo_flutter/shared/mobx/cidade_estado_store.dart'; // Importa a loja de cidade e estado
import 'package:estudo_flutter/shared/mobx/loading_store.dart'; // Importa a loja de carregamento
import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter
import 'package:flutter_mobx/flutter_mobx.dart'; // Importa o pacote para integração do MobX com o Flutter
import 'package:flutter_modular/flutter_modular.dart'; // Importa o pacote para modularização do Flutter
import 'package:estudo_flutter/shared/widgets/global_themes.dart'; // Importa temas globais
import 'package:estudo_flutter/shared/widgets/global_widgets.dart'; // Importa widgets globais

// Define a página de busca de CEP
class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key}); // Construtor da página com chave 
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState(); // Cria o estado da página
}

final GlobalWidgets widgets = GlobalWidgets(); // Instância dos widgets globais
final ThemeColors themeColors = ThemeColors(); // Instância dos temas globais

class _BuscaCepPageState extends State<BuscaCepPage> {
  final loadingStore = LoadingStore(); // Instância da loja de carregamento
  final TextEditingController _textController = TextEditingController(); // Controlador de texto para o campo de entrada
  String _displayText = ''; // Texto a ser exibido após a busca
  final BuscaCepStore _buscaCepStore = Modular.get<BuscaCepStore>(); // Instância da loja de busca de CEP obtida através do Modular
  final CidadeEstadoStore buscaCepPageStore = CidadeEstadoStore(); // Instância da loja de cidade e estado
  BuscaWidgets buscaWidgets = BuscaWidgets(); // Instância dos widgets específicos para busca

  // Função para confirmar o texto e buscar o CEP
  Future<void> _confirmText() async {
    loadingStore.isLoading = true; // Define que está carregando
    final String cep = _textController.text; // Obtém o CEP do controlador de texto
    try {
      final String cepText = await _buscaCepStore.getText(cep); // Chama a loja de busca de CEP para obter o texto
      await Future.delayed(const Duration(seconds: 1)); // Aguarda um segundo
      setState(() {
        loadingStore.isLoading = false; // Define que não está mais carregando
        _displayText = cepText; // Atualiza o texto a ser exibido
      });
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2)); // Aguarda dois segundos em caso de erro
      setState(() {
        loadingStore.isLoading = false; // Define que não está mais carregando
        _displayText = 'Erro ao fazer a requisição. Detalhes: $e'; // Atualiza o texto de erro a ser exibido
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
        resizeToAvoidBottomInset: false,
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
                "Buscar por CEP", // Título da página
                style: widgets.titleStyle, // Estilo do título
              ),
              const SizedBox(height: 86), // Espaçamento
              buscaWidgets.buildCepInput(_textController, "Digite o CEP para a busca"), // Campo de entrada para o CEP
              const SizedBox(height: 10), // Espaçamento
              buscaWidgets.confirmButton(_confirmText), // Botão de confirmação
              const SizedBox(height: 40), // Espaçamento
              Observer(builder: (_) {
                LoadingStore loadingStore = LoadingStore(); // Cria uma nova instância da loja de carregamento
                if (loadingStore.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(), // Indicador de carregamento
                  );
                } else {
                  return Text(
                    _displayText, // Exibe o texto resultante da busca
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // Estilo do texto
                  );
                }
              }),
              Container(), // Contêiner vazio (pode ser removido se não for necessário)
            ],
          ),
        ),
      ),
    );
  }
}
