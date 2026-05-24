part of 'home_viewmodel.dart';

class HomeModel {
  final List<Map<String, dynamic>> banners;
  final List<Map<String, dynamic>> ultimosBuscados;
  final List<ProdutoEntity> promocoes;

  HomeModel({
    this.banners = HomeClienteTestData.banners,
    this.ultimosBuscados = HomeClienteTestData.ultimosBuscados,
    this.promocoes = const [],
  });

  HomeModel copyWith({
    Updater<List<Map<String, dynamic>>>? banners,
    Updater<List<Map<String, dynamic>>>? ultimosBuscados,
    Updater<List<ProdutoEntity>>? promocoes,
  }) {
    return HomeModel(
      banners: banners != null ? banners.value! : this.banners,
      ultimosBuscados: ultimosBuscados != null ? ultimosBuscados.value! : this.ultimosBuscados,
      promocoes: promocoes != null ? promocoes.value! : this.promocoes,
    );
  }
}