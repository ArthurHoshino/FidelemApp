import 'package:fidelem_app/core/data/models/entity.dart';
import 'package:flutter/material.dart';
import 'package:fidelem_app/core/services/web_client.dart';
import 'dart:convert';
import 'package:fidelem_app/core/widgets/fid_select_controller.dart';
import 'package:fidelem_app/main.dart';
// import 'package:fidelem_app/modules/mercado/inventario/produto_model.dart';
import 'package:http/http.dart' as http;


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
        // print(dados[0]);
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
