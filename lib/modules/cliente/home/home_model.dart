part of 'home_viewmodel.dart';

class HomeModel {
  final List<Map<String, dynamic>> banners;
  final List<Map<String, dynamic>> ultimosBuscados;
  final List<ProdutoModel> promocoes;

  HomeModel({
    this.banners = HomeClienteTestData.banners,
    this.ultimosBuscados = HomeClienteTestData.ultimosBuscados,
    this.promocoes = const [],
  });

  HomeModel copyWith({
    List<Map<String, dynamic>>? banners,
    List<Map<String, dynamic>>? ultimosBuscados,
    List<ProdutoModel>? promocoes,
  }) {
    return HomeModel(
      banners: banners ?? this.banners,
      ultimosBuscados: ultimosBuscados ?? this.ultimosBuscados,
      promocoes: promocoes ?? this.promocoes,
    );
  }
}