import 'dart:convert';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/modules/cliente/carrinho/viewmodels/carrinho_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/cart_manager.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// Estrutura simples para diferenciar quem enviou a mensagem
class MensagemChat {
  final String texto;
  final bool isUsuario;

  MensagemChat({required this.texto, required this.isUsuario});
}

class FidChat extends StatefulWidget {
  final CarrinhoViewModel viewModel;
  // Você pode passar o viewModel aqui no construtor futuramente
  const FidChat({super.key, required this.viewModel});

  @override
  State<FidChat> createState() => _FidChatState();
}

class _FidChatState extends State<FidChat> {
  final TextEditingController _textoController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // 1. Usamos o 'late' para avisar ao Dart que essa variável 
  // será inicializada em breve, antes de ser usada na tela.
  late final List<MensagemChat> _mensagens;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    _mensagens = [
      MensagemChat(
        texto: (widget.viewModel.items.isNotEmpty 
            ? "Olá! Vi que você tem itens no carrinho. Quer que eu sugira alguma receita com eles?" 
            : "Parece que você ainda está com o carrinho vazio, adicione alguns itens e tente novamente."),
        isUsuario: false,
      ),
    ];
  }

  Future<void> _enviarMensagem() async {
    final texto = _textoController.text.trim();
    if (texto.isEmpty || _isLoading) return;

    // O Gemini exige que o histórico comece com uma mensagem do usuário.
    // O skipWhile remove a saudação inicial da IA do histórico enviado.
    final historico = _mensagens
        .skipWhile((m) => !m.isUsuario)
        .map((m) => {
          'role': m.isUsuario ? 'user' : 'model',
          'parts': [{'text': m.texto}]
        }).toList();

    setState(() {
      _isLoading = true;
      // 1. Adiciona a mensagem do usuário
      _mensagens.add(MensagemChat(texto: texto, isUsuario: true));
      _textoController.clear();
      
      // 2. Indicador de digitação
      _mensagens.add(MensagemChat(texto: "...", isUsuario: false));
    });

    _rolarParaFim();

    try {
      final response = await WebClient.sendData(
        endpoint: '${WebClient.iaService}/chat-receitas',
        method: HttpMethod.post,
        data: {
          'mensagemUsuario': texto,
          'historico': historico,
          'lcvensenhaid': CartManager.instance.userId,
          'lccarempresaid': CartManager.instance.empresaId,
          'itensCarrinho': widget.viewModel.items.map((item) => {
            'nome': item.nome,
            'quantidade': item.carrinhoData.lcCarQuantidade,
          }).toList(),
        },
      );

      if (!mounted) return;

      setState(() {
        _mensagens.removeLast(); // Remove o "..."
        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);
          final respostaIA = responseBody['resposta'] ?? 'Resposta não encontrada.';
          _mensagens.add(MensagemChat(texto: respostaIA, isUsuario: false));
        } else {
          _mensagens.add(MensagemChat(texto: "Erro ao comunicar com a IA. Tente novamente.", isUsuario: false));
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _mensagens.removeLast(); // Remove o "..."
        _mensagens.add(MensagemChat(texto: "Erro de conexão: \$e", isUsuario: false));
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        _rolarParaFim();
      }
    }
  }

  void _rolarParaFim() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textoController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Essa linha é o segredo para o input não ser engolido pelo teclado
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Puxador visual
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),

            // Cabeçalho
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    'Chef Virtual',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(height: 24),

            // Área das Mensagens (Balões)
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: _mensagens.length,
                itemBuilder: (context, index) {
                  final msg = _mensagens[index];
                  return _construirBalao(msg);
                },
              ),
            ),

            // Área de Input (Campo de texto e botão)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -2),
                    blurRadius: 4,
                  )
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textoController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        enabled: !_isLoading,
                        decoration: InputDecoration(
                          hintText: 'Digite sua mensagem...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: _isLoading ? Colors.grey : Colors.blueAccent,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 20),
                        onPressed: _isLoading ? null : _enviarMensagem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método que desenha os balões de forma dinâmica
  Widget _construirBalao(MensagemChat mensagem) {
    return Align(
      // Alinha à direita se for usuário, à esquerda se for IA
      alignment: mensagem.isUsuario ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, top: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75, // O balão ocupa no máx 75% da largura
        ),
        decoration: BoxDecoration(
          color: mensagem.isUsuario ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            // Corta a pontinha do balão dependendo de quem enviou
            bottomLeft: mensagem.isUsuario ? const Radius.circular(16) : const Radius.circular(4),
            bottomRight: mensagem.isUsuario ? const Radius.circular(4) : const Radius.circular(16),
          ),
        ),
        child: mensagem.isUsuario
            ? Text(
                mensagem.texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            : MarkdownBody(
                data: mensagem.texto,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  p: const TextStyle(color: Colors.black87, fontSize: 15),
                  strong: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  listBullet: const TextStyle(color: Colors.black87, fontSize: 15),
                ),
              ),
      ),
    );
  }
}