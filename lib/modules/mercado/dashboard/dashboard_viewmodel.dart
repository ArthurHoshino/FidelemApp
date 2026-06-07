import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../core/services/web_client.dart';
import '../../../main.dart';

/// Model classes para os dados de estatísticas

class KpiData {
  final int totalVendas;
  final int totalClientes;
  final int pontosDistribuidos;
  final int totalOperacoes;

  const KpiData({
    this.totalVendas = 0,
    this.totalClientes = 0,
    this.pontosDistribuidos = 0,
    this.totalOperacoes = 0,
  });

  factory KpiData.fromMap(Map<String, dynamic> map) {
    return KpiData(
      totalVendas: (map['totalVendas'] ?? 0) is int
          ? map['totalVendas']
          : int.tryParse(map['totalVendas'].toString()) ?? 0,
      totalClientes: (map['totalClientes'] ?? 0) is int
          ? map['totalClientes']
          : int.tryParse(map['totalClientes'].toString()) ?? 0,
      pontosDistribuidos: (map['pontosDistribuidos'] ?? 0) is int
          ? map['pontosDistribuidos']
          : int.tryParse(map['pontosDistribuidos'].toString()) ?? 0,
      totalOperacoes: (map['totalOperacoes'] ?? 0) is int
          ? map['totalOperacoes']
          : int.tryParse(map['totalOperacoes'].toString()) ?? 0,
    );
  }
}

class VendaDiaria {
  final String data;
  final int total;

  const VendaDiaria({required this.data, required this.total});

  factory VendaDiaria.fromMap(Map<String, dynamic> map) {
    return VendaDiaria(
      data: map['data']?.toString() ?? '',
      total: (map['total'] ?? 0) is int
          ? map['total']
          : int.tryParse(map['total'].toString()) ?? 0,
    );
  }
}

class HorarioPico {
  final int hora;
  final int total;

  const HorarioPico({required this.hora, required this.total});

  factory HorarioPico.fromMap(Map<String, dynamic> map) {
    return HorarioPico(
      hora: (map['hora'] ?? 0) is int
          ? map['hora']
          : int.tryParse(map['hora'].toString()) ?? 0,
      total: (map['total'] ?? 0) is int
          ? map['total']
          : int.tryParse(map['total'].toString()) ?? 0,
    );
  }
}

class VolumeAcao {
  final int acaoId;
  final String descricao;
  final int total;

  const VolumeAcao({
    required this.acaoId,
    required this.descricao,
    required this.total,
  });

  factory VolumeAcao.fromMap(Map<String, dynamic> map) {
    return VolumeAcao(
      acaoId: (map['acaoId'] ?? 0) is int
          ? map['acaoId']
          : int.tryParse(map['acaoId'].toString()) ?? 0,
      descricao: map['descricao']?.toString() ?? '',
      total: (map['total'] ?? 0) is int
          ? map['total']
          : int.tryParse(map['total'].toString()) ?? 0,
    );
  }
}

class CaixaCategoria {
  final String categoria;
  final double total;

  const CaixaCategoria({
    required this.categoria,
    required this.total,
  });

  factory CaixaCategoria.fromMap(Map<String, dynamic> map) {
    return CaixaCategoria(
      categoria: map['categoria']?.toString() ?? '',
      total: (map['total'] ?? 0.0) is num
          ? (map['total'] as num).toDouble()
          : double.tryParse(map['total'].toString()) ?? 0.0,
    );
  }
}

class PontosResumo {
  final int acumulados;
  final int resgatados;

  const PontosResumo({this.acumulados = 0, this.resgatados = 0});

  factory PontosResumo.fromMap(Map<String, dynamic> map) {
    return PontosResumo(
      acumulados: (map['acumulados'] ?? 0) is int
          ? map['acumulados']
          : int.tryParse(map['acumulados'].toString()) ?? 0,
      resgatados: (map['resgatados'] ?? 0) is int
          ? map['resgatados']
          : int.tryParse(map['resgatados'].toString()) ?? 0,
    );
  }
}

/// ViewModel principal do Dashboard de Estatísticas
class DashboardViewModel extends ChangeNotifier {
  // Estado
  bool isLoading = false;
  String? errorMessage;
  int diasSelecionados = 30;

  // Dados
  KpiData kpis = const KpiData();
  List<VendaDiaria> vendasPorDia = [];
  List<HorarioPico> horariosPico = [];
  List<VolumeAcao> volumeAcoes = [];
  List<VendaDiaria> novosCadastros = [];
  PontosResumo pontosResumo = const PontosResumo();

  List<CaixaCategoria> caixaPorCategoria = [];

  /// Carrega todas as estatísticas da API
  Future<void> carregarEstatisticas() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await WebClient.getData(
        WebClient.estatisticas,
        queryParameters: {
          'empresaid': MyApp.empresaId,
          'dias': diasSelecionados.toString(),
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> dados = jsonDecode(response.body);

        // KPIs
        if (dados['kpis'] != null) {
          kpis = KpiData.fromMap(dados['kpis'] as Map<String, dynamic>);
        }

        // Vendas por dia
        if (dados['vendasPorDia'] != null) {
          vendasPorDia = (dados['vendasPorDia'] as List)
              .map((e) => VendaDiaria.fromMap(e as Map<String, dynamic>))
              .toList();
        }

        // Horários de pico
        if (dados['horariosPico'] != null) {
          horariosPico = (dados['horariosPico'] as List)
              .map((e) => HorarioPico.fromMap(e as Map<String, dynamic>))
              .toList();
        }

        // Volume de ações
        if (dados['volumeAcoes'] != null) {
          volumeAcoes = (dados['volumeAcoes'] as List)
              .map((e) => VolumeAcao.fromMap(e as Map<String, dynamic>))
              .toList();
        }

        // Novos cadastros
        if (dados['novosCadastros'] != null) {
          novosCadastros = (dados['novosCadastros'] as List)
              .map((e) => VendaDiaria.fromMap(e as Map<String, dynamic>))
              .toList();
        }

        // Caixa por categoria
        if (dados['caixaPorCategoria'] != null) {
          caixaPorCategoria = (dados['caixaPorCategoria'] as List)
              .map((e) => CaixaCategoria.fromMap(e as Map<String, dynamic>))
              .toList();
        }

        // Pontos resumo
        if (dados['pontosResumo'] != null) {
          pontosResumo = PontosResumo.fromMap(
            dados['pontosResumo'] as Map<String, dynamic>,
          );
        }
      } else {
        errorMessage = 'Erro ao carregar estatísticas (${response.statusCode})';
      }
    } catch (e) {
      errorMessage = 'Erro de conexão: $e';
      debugPrint('Erro ao carregar estatísticas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Altera o período de filtro e recarrega
  void alterarPeriodo(int dias) {
    if (dias == diasSelecionados) return;
    diasSelecionados = dias;
    carregarEstatisticas();
  }
}
