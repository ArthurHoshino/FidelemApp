class HomeClienteTestData {
  static const String testImage = "lib/core/assets/teste/mrpotato.png";

  static final List<Map<String, dynamic>> banners = [
    {"id": 1, "titulo": "Oferta Relâmpago", "imagem": testImage},
    {"id": 2, "titulo": "Novidades", "imagem": testImage},
    {"id": 3, "titulo": "Queima de Estoque", "imagem": testImage},
    {"id": 4, "titulo": "Fidelidade", "imagem": testImage},
    {"id": 5, "titulo": "Parceiros", "imagem": testImage},
  ];

  static final List<Map<String, dynamic>> ultimosBuscados = [
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

  static final List<Map<String, dynamic>> promocoes = [
    {
      "id": 201,
      "titulo": "Batata Frita",
      "preco": "R\$ 25,00",
      "imagem": testImage
    },
    {
      "id": 202,
      "titulo": "Hamburguer",
      "preco": "R\$ 30,00",
      "imagem": testImage
    },
    {
      "id": 203,
      "titulo": "Refrigerante",
      "preco": "R\$ 8,00",
      "imagem": testImage
    },
    {
      "id": 204,
      "titulo": "Combo Batata",
      "preco": "R\$ 45,00",
      "imagem": testImage
    },
  ];
}