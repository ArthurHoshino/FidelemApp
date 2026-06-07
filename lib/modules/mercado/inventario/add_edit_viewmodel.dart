import 'dart:io';
import 'package:fidelem_app/core/data/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'dart:convert';
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';
import 'package:fidelem_app/main.dart';
// import 'package:fidelem_app/modules/mercado/inventario/produto_model.dart';


class ProdutoImagemItem {
  int? id;
  final String? base64Content;
  final File? localFile;
  int order;

  ProdutoImagemItem({
    this.id,
    this.base64Content,
    this.localFile,
    required this.order,
  });

  bool get isLocal => localFile != null;
  bool get isRemote => id != null;
}

class AddEditViewmodel extends ChangeNotifier {
  // Controladores para pegarem o texto da view
  final TextEditingController eanController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController estoqueController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController descontoController = TextEditingController();
  final TextEditingController pontoController = TextEditingController();
  final FIDSelectController categoriaController = FIDSelectController();

  // Estado da tela
  bool isLoading = false;
  String? errorMessage;
  List<String> categorias = [];
  final Map<String, int> _categoriasMap = {};

  List<ProdutoImagemItem> produtoImagens = [];
  List<int> imagensParaDeletar = [];

  AddEditViewmodel() {
    carregarCategorias();
  }


  void clear() {
    eanController.text = "";
    nomeController.text = "";
    descController.text = "";
    estoqueController.text = "";
    precoController.text = "";
    pontoController.text = "";
    descontoController.text = "";
    categoriaController.value = null;
    produtoImagens.clear();
    imagensParaDeletar.clear();
    notifyListeners();
  }


  // Metodo para buscar as categorias no banco
  Future<void> carregarCategorias() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await WebClient.getData(
        WebClient.cdCategoria,
        queryParameters: {
          'cdcatempresaid': MyApp.empresaId,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);

        categorias.clear();
        _categoriasMap.clear();

        for (var item in dados) {
          final String categoria = item['CDCATNOME'] ?? item['Categoria'] ?? 'Sem categoria';
          final int id = item['CDCATID'] ?? item['ID'] ?? 0;

          categorias.add(categoria);
          _categoriasMap[categoria] = id;
        }
      }
    }catch (e) {
      errorMessage = "Erro ao carregar categorias: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> carregarImagensProduto(int prodId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await WebClient.getData(
        WebClient.cdProdutoImagem,
        queryParameters: {'cdprodimgprodutoid': prodId},
      );
      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);
        produtoImagens.clear();
        imagensParaDeletar.clear();
        for (var i = 0; i < dados.length; i++) {
          final item = dados[i];
          produtoImagens.add(
            ProdutoImagemItem(
              id: item['CDPRODIMGID'],
              base64Content: item['CDPRODIMGBLOB'],
              order: item['CDPRODIMGORDEM'] ?? (i + 1),
            ),
          );
        }
      }
    } catch (e) {
      errorMessage = "Erro ao carregar imagens do produto: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void adicionarImagemLocal(File file) {
    final maxOrder = produtoImagens.isEmpty
        ? 0
        : produtoImagens.map((e) => e.order).reduce((a, b) => a > b ? a : b);
    produtoImagens.add(
      ProdutoImagemItem(
        localFile: file,
        order: maxOrder + 1,
      ),
    );
    notifyListeners();
  }

  void removerImagem(int index) {
    final item = produtoImagens[index];
    if (item.isRemote && item.id != null) {
      imagensParaDeletar.add(item.id!);
    }
    produtoImagens.removeAt(index);
    for (var i = 0; i < produtoImagens.length; i++) {
      produtoImagens[i].order = i + 1;
    }
    notifyListeners();
  }

  void reordenarImagens(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = produtoImagens.removeAt(oldIndex);
    produtoImagens.insert(newIndex, item);
    for (var i = 0; i < produtoImagens.length; i++) {
      produtoImagens[i].order = i + 1;
    }
    notifyListeners();
  }

  Future<void> salvarImagens(int prodId) async {
    // 1. Deletar imagens removidas
    for (final id in imagensParaDeletar) {
      try {
        await WebClient.sendData(
          endpoint: WebClient.cdProdutoImagem,
          method: HttpMethod.delete,
          data: {
            'empresa': MyApp.empresaId,
            'cdprodimgid': id,
            'cdprodimgprodutoid': prodId,
          },
        );
      } catch (e) {
        print("Erro ao deletar imagem $id: $e");
      }
    }
    imagensParaDeletar.clear();

    // 2. Upload de novas imagens locais
    for (var i = 0; i < produtoImagens.length; i++) {
      final img = produtoImagens[i];
      if (img.isLocal && img.localFile != null) {
        try {
          final bytes = await img.localFile!.readAsBytes();
          final response = await WebClient.sendMultipartData(
            endpoint: WebClient.cdProdutoImagem,
            method: HttpMethod.post,
            fields: {
              'cdprodimgprodutoid': prodId.toString(),
              'cdprodimgordem': img.order.toString(),
              'empresa': MyApp.empresaId.toString(),
            },
            fileKey: 'prodimagem',
            fileBytes: bytes,
            fileName: 'imagem_${img.order}.jpg',
          );
          if (response.statusCode == 200) {
            final Map<String, dynamic> responseData = jsonDecode(response.body);
            img.id = responseData['id'];
          }
        } catch (e) {
          print("Erro ao enviar imagem local: $e");
        }
      }
    }

    // 3. Reordenar todas as imagens no servidor
    final List<int> imageIds = produtoImagens
        .where((img) => img.id != null)
        .map((img) => img.id!)
        .toList();

    if (imageIds.isNotEmpty) {
      try {
        await WebClient.sendData(
          endpoint: '${WebClient.cdProdutoImagem}/reorder',
          method: HttpMethod.put,
          data: {
            'cdprodimgprodutoid': prodId,
            'imageIds': imageIds,
            'empresa': MyApp.empresaId,
          },
        );
      } catch (e) {
        print("Erro ao reordenar imagens: $e");
      }
    }
  }

  Future<void> inserirProduto(BuildContext context) async {
    final response = await WebClient.sendData(
      endpoint: WebClient.cdProduto,
      method: HttpMethod.post,
      data: {
        "cdprodid": eanController.text,
        "cdprodnome": nomeController.text,
        "cdprodprecoreal": double.tryParse(
            precoController.text.replaceAll(",", ".")) ?? "",
        "cdprodprecoponto": double.tryParse(pontoController.text.replaceAll(",", ".")),
        "cdproddescricao": descController.text,
        "cdprodqtdestoque": int.tryParse(estoqueController.text) ?? "",
        "cdprodempresaid": MyApp.empresaId,
        "cdprodcategoriaid": _categoriasMap[categoriaController.value],
        "cdprodprecodesconto" : double.tryParse(
            descontoController.text.replaceAll(",", ".")),
      },
    );

    if (response.statusCode < 300) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final int novoProdId = responseData['id'];
      await salvarImagens(novoProdId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produto Inserido com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );

      clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text(response.statusCode  == 400 ? "Dados obrigatorios não preenchidos" : "Erro ao inserir produto"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<void> atualizarProduto(BuildContext context) async {
    final response = await WebClient.sendData(
      endpoint: WebClient.cdProduto,
      method: HttpMethod.put,
      data: {
        "cdprodid": eanController.text,
        "cdprodnome": nomeController.text,
        "cdprodprecoreal": double.tryParse(
            precoController.text.replaceAll(",", ".")) ?? "",
        "cdprodprecoponto": double.tryParse(pontoController.text.replaceAll(",", ".")),
        "cdproddescricao": descController.text,
        "cdprodqtdestoque": int.parse(estoqueController.text),
        "cdprodempresaid": MyApp.empresaId,
        "cdprodcategoriaid": _categoriasMap[categoriaController.value],
        "cdprodprecodesconto" : double.tryParse(
            descontoController.text.replaceAll(",", ".")),
      },
    );

    if (response.statusCode < 300) {
      final int prodId = int.parse(eanController.text);
      await salvarImagens(prodId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Produto atualizado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );

      clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao atualizar produto"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  Future<Map<dynamic, dynamic>> getProdutoById(int? produtoId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await WebClient.getData(WebClient.cdProduto, queryParameters: {"cdprodid": produtoId, "cdprodempresaid": MyApp.empresaId});
      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);
        return dados[0];
      }
    }catch (e) {
      errorMessage = "Erro ao carregar produto: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return {};
  }

  void setProduto(ProdutoEntity? prod) {
    if (prod == null) return;

    eanController.text = prod.id.toString();
    nomeController.text = prod.nome;
    descController.text = prod.descricao;
    estoqueController.text = prod.qtdEstoque.toString();
    precoController.text = prod.precoReal.toString();
    pontoController.text = prod.precoPonto.toString();
    categoriaController.value = prod.categoria;
    descontoController.text = prod.precoDesconto?.toString() ?? '';
  }

  Future<void> setProdutoById(int? prodId) async {
    final dados = await getProdutoById(prodId);
    eanController.text = prodId.toString();
    nomeController.text = dados["CDPRODNOME"] ?? '';
    descController.text = dados["CDPRODDESCRICAO"] ?? '';
    estoqueController.text = dados["CDPRODQTDESTOQUE"]?.toString() ?? '';
    precoController.text = dados["CDPRODPRECOREAL"]?.toString() ?? '';
    pontoController.text = dados["CDPRODPRECOPONTO"]?.toString() ?? '';
    descontoController.text = dados["CDPRODPRECODESCONTO"]?.toString() ?? '';

    categoriaController.value = await getCategoriaNome(dados["CDPRODCATEGORIAID"]);

    if (prodId != null) {
      await carregarImagensProduto(prodId);
    }
  }

  Future<String> getCategoriaNome(int? catId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await WebClient.getData(WebClient.cdCategoria, queryParameters: {"cdcatid": catId});
      if (response.statusCode == 200) {
        final List<dynamic> dados = jsonDecode(response.body);
        return (dados[0]["CDCATNOME"]);
      }
    }catch (e) {
      errorMessage = "Erro ao carregar produto: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return "";
  }


}
