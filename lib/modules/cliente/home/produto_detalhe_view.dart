import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/data/models/entity.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/main.dart';
import 'package:fidelem_app/modules/cliente/home/home_viewmodel.dart';

class ProdutoDetalheView extends StatefulWidget {
  final ProdutoEntity produto;

  const ProdutoDetalheView({super.key, required this.produto});

  @override
  State<ProdutoDetalheView> createState() => _ProdutoDetalheViewState();
}

class _ProdutoDetalheViewState extends State<ProdutoDetalheView> {
  List<String> _images = [];
  bool _loadingImages = true;
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _images = widget.produto.imagem != null && widget.produto.imagem!.isNotEmpty
        ? [widget.produto.imagem!]
        : [];
    _carregarImagens();
    _registrarVisualizacao();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _carregarImagens() async {
    try {
      final response = await WebClient.getData(
        WebClient.cdProdutoImagem,
        queryParameters: {'cdprodimgprodutoid': widget.produto.id},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<String> loadedImages = [];
        for (var img in data) {
          if (img['CDPRODIMGBLOB'] != null) {
            loadedImages.add(img['CDPRODIMGBLOB']);
          }
        }
        if (mounted) {
          setState(() {
            _images = loadedImages.isNotEmpty ? loadedImages : _images;
            _loadingImages = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _loadingImages = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingImages = false;
        });
      }
    }
  }

  Future<void> _registrarVisualizacao() async {
    try {
      await WebClient.sendData(
        endpoint: 'lcauditoria',
        method: HttpMethod.post,
        data: {
          'lcauddescricao': 'Visualizou o produto: ${widget.produto.nome} (ID: ${widget.produto.id}) (Usuario: ${MyApp.dadosUsuario?.id})',
          'lcaudacaoid': 7,
          'lcaudempresaid': MyApp.empresaId,
        },
      );
      HomeViewmodel().carregarDadosUltimosVisualizados();
    } catch (e) {
      print('Erro ao registrar visualizacao: $e');
    }
  }

  void _abrirImagemCompleta(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 4.0,
              child: _buildSingleImage(_images[index], fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double carouselHeight = screenHeight * 0.4;

    // Calcular desconto
    final double originalPrice = widget.produto.precoReal;
    final double? discountPrice = widget.produto.precoDesconto;
    final bool hasDiscount = discountPrice != null && discountPrice > 0 && discountPrice < originalPrice;
    final double finalPrice = hasDiscount ? discountPrice : originalPrice;
    final int points = widget.produto.precoPonto;

    return Scaffold(
      backgroundColor: Cor.branco,
      appBar: AppBar(
        title: Text(
          widget.produto.nome,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Cor.preto),
        ),
        centerTitle: true,
        backgroundColor: Cor.branco,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Cor.azul),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagens Carousel
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: carouselHeight,
                  decoration: const BoxDecoration(
                    color: Cor.azulClaro1,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                    child: _loadingImages && _images.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(color: Cor.azul),
                          )
                        : _images.isEmpty
                            ? const Center(
                                child: Icon(Icons.image, size: 100, color: Cor.azul),
                              )
                            : PageView.builder(
                            controller: _pageController,
                            itemCount: _images.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => _abrirImagemCompleta(index),
                                child: Hero(
                                  tag: 'product_image_${widget.produto.id}_$index',
                                  child: _buildSingleImage(_images[index], fit: BoxFit.cover),
                                ),
                              );
                            },
                          ),
                  ),
                ),
                // Indicator dots
                if (_images.length > 1)
                  Positioned(
                    bottom: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_images.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentImageIndex == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentImageIndex == index ? Cor.azul : Cor.cinzaClaro,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Preço e Desconto
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "R\$ ${finalPrice.toStringAsFixed(2).replaceAll('.', ',')}",
                        style: TextStyle(
                          fontSize: screenHeight * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Cor.azul,
                        ),
                      ),
                      if (hasDiscount) ...[
                        const SizedBox(width: 12),
                        Text(
                          "R\$ ${originalPrice.toStringAsFixed(2).replaceAll('.', ',')}",
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Cor.cinzaClaro,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Cor.vermelho.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${(((originalPrice - discountPrice) / originalPrice) * 100).toStringAsFixed(0)}% OFF",
                            style: const TextStyle(
                              color: Cor.vermelho,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Pontos
                  if (points > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Cor.azulClaro1,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Cor.azul.withOpacity(0.3), width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Cor.azul, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            "Ou compre por ",
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              color: Cor.cinzaEscuro,
                            ),
                          ),
                          Text(
                            "$points pontos",
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              fontWeight: FontWeight.bold,
                              color: Cor.azul,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Nome do Produto
                  FIDText(
                    baseText: widget.produto.nome,
                    preset: FIDText.large,
                    fontWeight: FontWeight.bold,
                    color: Cor.preto,
                    textAlign: TextAlign.left,
                    padding: const {"bottom": 0.01},
                  ),

                  const Divider(height: 16, thickness: 1, color: Cor.azulClaro1),

                  // Descrição
                  FIDText(
                    baseText: "Descrição do Produto",
                    preset: FIDText.medium,
                    fontWeight: FontWeight.bold,
                    color: Cor.preto,
                    textAlign: TextAlign.left,
                    padding: const {"bottom": 0.008},
                  ),

                  Text(
                    widget.produto.descricao.isNotEmpty ? widget.produto.descricao : "Sem descrição disponível.",
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      color: Cor.cinzaEscuro,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleImage(String base64Image, {required BoxFit fit}) {
    if (base64Image.isEmpty) {
      return const Center(child: Icon(Icons.image, size: 60, color: Cor.azul));
    }
    if (base64Image.startsWith('assets/')) {
      return Image.asset(
        base64Image,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
      );
    }
    try {
      return Image.memory(
        base64Decode(base64Image),
        fit: fit,
        width: double.infinity,
        height: double.infinity,
      );
    } catch (_) {
      return const Center(child: Icon(Icons.image_not_supported, size: 60, color: Cor.azul));
    }
  }
}
