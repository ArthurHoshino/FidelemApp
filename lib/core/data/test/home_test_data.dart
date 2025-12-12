class HomeTestData {
  static const String _testImage = "lib/core/assets/teste/mrpotato.png";

  static final List<Map<String, dynamic>> banners = [
    {"id": 1, "titulo": "Oferta Relâmpago", "imagem": _testImage},
    {"id": 2, "titulo": "Novidades", "imagem": _testImage},
    {"id": 3, "titulo": "Queima de Estoque", "imagem": _testImage},
    {"id": 4, "titulo": "Fidelidade", "imagem": _testImage},
    {"id": 5, "titulo": "Parceiros", "imagem": _testImage},
  ];

  static final List<Map<String, dynamic>> ultimosBuscados = [
    {
      "id": 101,
      "titulo": "Peito de Frango",
      "subtitulo": "Picado 1kg",
      "imagem": _testImage
    },
    {
      "id": 102,
      "titulo": "Coca-Cola",
      "subtitulo": "Garrafa 2L",
      "imagem": _testImage
    },
    {
      "id": 103,
      "titulo": "Arroz Branco",
      "subtitulo": "Pacote 5kg",
      "imagem": _testImage
    },
  ];

  static final List<Map<String, dynamic>> promocoes = [
    {
      "id": 201,
      "titulo": "Batata Frita",
      "preco": "R\$ 25,00",
      "imagem": _testImage
    },
    {
      "id": 202,
      "titulo": "Hamburguer",
      "preco": "R\$ 30,00",
      "imagem": _testImage
    },
    {
      "id": 203,
      "titulo": "Refrigerante",
      "preco": "R\$ 8,00",
      "imagem": _testImage
    },
    {
      "id": 204,
      "titulo": "Combo Batata",
      "preco": "R\$ 45,00",
      "imagem": _testImage
    },
  ];
}