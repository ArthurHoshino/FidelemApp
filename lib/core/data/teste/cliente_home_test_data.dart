import 'package:fidelem_app/core/data/models/models.dart';

class HomeClienteTestData {
  static const String testImage = "lib/core/assets/teste/mrpotato.png";

  static const List<Map<String, dynamic>> banners = [
    {"id": 1, "titulo": "Oferta Relâmpago", "imagem": testImage},
    {"id": 2, "titulo": "Novidades", "imagem": testImage},
    {"id": 3, "titulo": "Queima de Estoque", "imagem": testImage},
    {"id": 4, "titulo": "Fidelidade", "imagem": testImage},
    {"id": 5, "titulo": "Parceiros", "imagem": testImage},
  ];

  static const List<Map<String, dynamic>> ultimosBuscados = [
    {
      "id": 101,
      "titulo": "Peito de Frango",
      "subtitulo": "Picado 1kg",
      "imagem": testImage
    },
    {
      "id": 102,
      "titulo": "Coca-Cola",
      "subtitulo": "Garrafa 2L",
      "imagem": testImage
    },
    {
      "id": 103,
      "titulo": "Arroz Branco",
      "subtitulo": "Pacote 5kg",
      "imagem": testImage
    },
  ];

  static final List<ProdutoModel> promocoes = [
    ProdutoModel(
        id: 1,
        nome: 'Batata Frita',
        descricao: 'Feito com batata de verdade',
        precoReal: 25,
        precoPonto: 500,
        qtdEstoque: 60,
        precoDesconto: 30,
        imagem: testImage,
    ),
    ProdutoModel(
        id: 2,
        nome: 'Hambúrguer',
        descricao: 'Hambúrguer de carne bovina',
        precoReal: 33,
        precoPonto: 1500,
        qtdEstoque: 15,
        precoDesconto: 1999.99,
        imagem: testImage,
    ),
    ProdutoModel(
        id: 3,
        nome: 'Refrigerante',
        descricao: 'Refrigerante de cola',
        precoReal: 7.99,
        precoPonto: 250,
        qtdEstoque: 47,
        precoDesconto: 14.99,
        imagem: testImage,
    ),
    ProdutoModel(
        id: 4,
        nome: 'Combo batata',
        descricao: 'Combo com batatas fritas e refrigerante',
        precoReal: 75,
        precoPonto: 4000,
        qtdEstoque: 5,
        precoDesconto: 30,
    ),
  ];
}