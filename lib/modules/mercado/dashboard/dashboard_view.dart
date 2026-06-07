import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fidelem_app/core/tema/tema.dart';
import 'package:fidelem_app/modules/mercado/dashboard/dashboard_viewmodel.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  final DashboardViewModel viewModel = DashboardViewModel();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    await viewModel.carregarEstatisticas();
    if (mounted) {
      setState(() {});
      _fadeController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: RefreshIndicator(
          color: Cor.azul,
          onRefresh: _carregarDados,
          child: viewModel.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Cor.azul),
                )
              : viewModel.errorMessage != null
                  ? _buildErrorState()
                  : FadeTransition(
                      opacity: _fadeAnimation,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(),
                            const SizedBox(height: 20),
                            _buildPeriodSelector(),
                            const SizedBox(height: 24),
                            _buildKpiCards(),
                            const SizedBox(height: 28),
                            _buildChartCard(
                              title: 'Vendas por Dia',
                              icon: Icons.trending_up_rounded,
                              iconColor: const Color(0xFF4CAF50),
                              child: _buildVendasChart(),
                            ),
                            const SizedBox(height: 20),
                            _buildChartCard(
                              title: 'Horários de Pico',
                              icon: Icons.schedule_rounded,
                              iconColor: const Color(0xFFFF9800),
                              child: _buildHorariosPicoChart(),
                            ),
                            const SizedBox(height: 20),
                            _buildChartCard(
                              title: 'Volume de Ações',
                              icon: Icons.donut_large_rounded,
                              iconColor: const Color(0xFF9C27B0),
                              child: _buildVolumeAcoesChart(),
                            ),
                            const SizedBox(height: 20),
                            _buildChartCard(
                              title: 'Novos Cadastros',
                              icon: Icons.person_add_rounded,
                              iconColor: const Color(0xFF2196F3),
                              child: _buildNovosCadastrosChart(),
                            ),
                            const SizedBox(height: 20),
                            _buildChartCard(
                              title: 'Caixa por Categoria',
                              icon: Icons.pie_chart_rounded,
                              iconColor: const Color(0xFF673AB7),
                              child: _buildCaixaPorCategoriaChart(),
                            ),
                            const SizedBox(height: 20),
                            _buildChartCard(
                              title: 'Pontos: Acumulados vs Resgatados',
                              icon: Icons.stars_rounded,
                              iconColor: const Color(0xFFFF5722),
                              child: _buildPontosChart(),
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }

  // ========================================
  // HEADER
  // ========================================
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Cor.azul.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.analytics_rounded, color: Colors.white, size: 28),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estatísticas',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A237E),
                letterSpacing: -0.5,
              ),
            ),
            Text(
              'Visão geral do seu negócio',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF78909C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ========================================
  // PERIOD SELECTOR
  // ========================================
  Widget _buildPeriodSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [7, 30, 90].map((dias) {
          final isSelected = viewModel.diasSelecionados == dias;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                viewModel.alterarPeriodo(dias);
                setState(() {});
                _carregarDados();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${dias}d',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : const Color(0xFF90A4AE),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ========================================
  // KPI CARDS
  // ========================================
  Widget _buildKpiCards() {
    final kpis = viewModel.kpis;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.35,
      children: [
        _buildKpiCard(
          icon: Icons.shopping_cart_rounded,
          label: 'Vendas',
          value: kpis.totalVendas.toString(),
          gradient: const [Color(0xFF43A047), Color(0xFF66BB6A)],
        ),
        _buildKpiCard(
          icon: Icons.people_rounded,
          label: 'Clientes Ativos',
          value: kpis.totalClientes.toString(),
          gradient: const [Color(0xFF1976D2), Color(0xFF42A5F5)],
        ),
        _buildKpiCard(
          icon: Icons.stars_rounded,
          label: 'Pontos Distrib.',
          value: _formatarNumero(kpis.pontosDistribuidos),
          gradient: const [Color(0xFFFF8F00), Color(0xFFFFB74D)],
        ),
        _buildKpiCard(
          icon: Icons.bolt_rounded,
          label: 'Operações',
          value: _formatarNumero(kpis.totalOperacoes),
          gradient: const [Color(0xFF7B1FA2), Color(0xFFAB47BC)],
        ),
      ],
    );
  }

  Widget _buildKpiCard({
    required IconData icon,
    required String label,
    required String value,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: gradient[0].withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ========================================
  // CHART CARD WRAPPER
  // ========================================
  Widget _buildChartCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF263238),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  // ========================================
  // CHART 1: VENDAS POR DIA (Bar Chart)
  // ========================================
  Widget _buildVendasChart() {
    if (viewModel.vendasPorDia.isEmpty) {
      return _buildEmptyChart('Nenhuma venda registrada no período');
    }

    final maxY = viewModel.vendasPorDia
        .map((e) => e.total.toDouble())
        .reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY * 1.3,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => const Color(0xFF37474F),
              tooltipRoundedRadius: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final venda = viewModel.vendasPorDia[groupIndex];
                return BarTooltipItem(
                  '${_formatarData(venda.data)}\n${venda.total} vendas',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= viewModel.vendasPorDia.length) {
                    return const SizedBox.shrink();
                  }
                  // Show limited labels to avoid crowding
                  final step = (viewModel.vendasPorDia.length / 6).ceil().clamp(1, 100);
                  if (idx % step != 0) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _formatarDataCurta(viewModel.vendasPorDia[idx].data),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF90A4AE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  if (value == 0) return const SizedBox.shrink();
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF90A4AE),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY / 4).clamp(1, double.infinity),
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFECEFF1),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: viewModel.vendasPorDia.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value.total.toDouble(),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  width: viewModel.vendasPorDia.length > 15 ? 8 : 16,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                ),
              ],
            );
          }).toList(),
        ),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  // ========================================
  // CHART 2: HORÁRIOS DE PICO (Line Chart)
  // ========================================
  Widget _buildHorariosPicoChart() {
    if (viewModel.horariosPico.isEmpty) {
      return _buildEmptyChart('Nenhum dado de horário disponível');
    }

    final maxY = viewModel.horariosPico
        .map((e) => e.total.toDouble())
        .reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => const Color(0xFF37474F),
              tooltipRoundedRadius: 8,
              getTooltipItems: (spots) {
                return spots.map((spot) {
                  return LineTooltipItem(
                    '${spot.x.toInt()}h\n${spot.y.toInt()} operações',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY / 4).clamp(1, double.infinity),
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFECEFF1),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 3,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${value.toInt()}h',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF90A4AE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  if (value == 0) return const SizedBox.shrink();
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF90A4AE),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 23,
          minY: 0,
          maxY: maxY * 1.2,
          lineBarsData: [
            LineChartBarData(
              spots: viewModel.horariosPico
                  .map((e) => FlSpot(e.hora.toDouble(), e.total.toDouble()))
                  .toList(),
              isCurved: true,
              curveSmoothness: 0.3,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 2.5,
                    strokeColor: const Color(0xFFFF9800),
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF9800).withValues(alpha: 0.2),
                    const Color(0xFFFF9800).withValues(alpha: 0.02),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  // ========================================
  // CHART 3: VOLUME DE AÇÕES (Pie Chart)
  // ========================================
  Widget _buildVolumeAcoesChart() {
    if (viewModel.volumeAcoes.isEmpty) {
      return _buildEmptyChart('Nenhuma ação registrada no período');
    }

    final colors = [
      const Color(0xFF2196F3),
      const Color(0xFF4CAF50),
      const Color(0xFFFF9800),
      const Color(0xFF9C27B0),
      const Color(0xFFE91E63),
      const Color(0xFF00BCD4),
      const Color(0xFFFF5722),
      const Color(0xFF795548),
      const Color(0xFF607D8B),
      const Color(0xFFCDDC39),
    ];

    final totalGeral = viewModel.volumeAcoes
        .map((e) => e.total)
        .fold(0, (a, b) => a + b);

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 3,
              centerSpaceRadius: 50,
              sections: viewModel.volumeAcoes.asMap().entries.map((entry) {
                final idx = entry.key;
                final acao = entry.value;
                final pct = totalGeral > 0
                    ? (acao.total / totalGeral * 100)
                    : 0.0;
                return PieChartSectionData(
                  color: colors[idx % colors.length],
                  value: acao.total.toDouble(),
                  title: '${pct.toStringAsFixed(0)}%',
                  radius: 35,
                  titleStyle: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
          ),
        ),
        const SizedBox(height: 16),
        // Legenda
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: viewModel.volumeAcoes.asMap().entries.map((entry) {
            final idx = entry.key;
            final acao = entry.value;
            return _buildLegendItem(
              color: colors[idx % colors.length],
              label: acao.descricao,
              value: acao.total.toString(),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ========================================
  // CHART 4: NOVOS CADASTROS (Bar Chart)
  // ========================================
  Widget _buildNovosCadastrosChart() {
    if (viewModel.novosCadastros.isEmpty) {
      return _buildEmptyChart('Nenhum cadastro registrado no período');
    }

    final maxY = viewModel.novosCadastros
        .map((e) => e.total.toDouble())
        .reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY * 1.3,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => const Color(0xFF37474F),
              tooltipRoundedRadius: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final cadastro = viewModel.novosCadastros[groupIndex];
                return BarTooltipItem(
                  '${_formatarData(cadastro.data)}\n${cadastro.total} cadastros',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= viewModel.novosCadastros.length) {
                    return const SizedBox.shrink();
                  }
                  final step = (viewModel.novosCadastros.length / 6).ceil().clamp(1, 100);
                  if (idx % step != 0) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _formatarDataCurta(viewModel.novosCadastros[idx].data),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF90A4AE),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  if (value == 0) return const SizedBox.shrink();
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF90A4AE),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY / 4).clamp(1, double.infinity),
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFECEFF1),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: viewModel.novosCadastros.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value.total.toDouble(),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  width: viewModel.novosCadastros.length > 15 ? 8 : 16,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                ),
              ],
            );
          }).toList(),
        ),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  // ========================================
  // CHART 5: PONTOS ACUMULADOS VS RESGATADOS (Donut)
  // ========================================
  Widget _buildPontosChart() {
    final acum = viewModel.pontosResumo.acumulados;
    final resg = viewModel.pontosResumo.resgatados;

    if (acum == 0 && resg == 0) {
      return _buildEmptyChart('Nenhuma movimentação de pontos no período');
    }

    final total = acum + resg;

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 55,
              sections: [
                PieChartSectionData(
                  color: const Color(0xFF4CAF50),
                  value: acum.toDouble(),
                  title: total > 0
                      ? '${(acum / total * 100).toStringAsFixed(0)}%'
                      : '0%',
                  radius: 35,
                  titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  color: const Color(0xFFFF5722),
                  value: resg.toDouble(),
                  title: total > 0
                      ? '${(resg / total * 100).toStringAsFixed(0)}%'
                      : '0%',
                  radius: 35,
                  titleStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(
              color: const Color(0xFF4CAF50),
              label: 'Acumulados',
              value: _formatarNumero(acum),
            ),
            const SizedBox(width: 24),
            _buildLegendItem(
              color: const Color(0xFFFF5722),
              label: 'Resgatados',
              value: _formatarNumero(resg),
            ),
          ],
        ),
      ],
    );
  }

  // ========================================
  // CHART 6: CAIXA POR CATEGORIA (Pie Chart)
  // ========================================
  Widget _buildCaixaPorCategoriaChart() {
    if (viewModel.caixaPorCategoria.isEmpty) {
      return _buildEmptyChart('Nenhum dado de caixa por categoria no período');
    }

    final colors = [
      const Color(0xFF673AB7),
      const Color(0xFFE91E63),
      const Color(0xFF3F51B5),
      const Color(0xFF009688),
      const Color(0xFFFFC107),
      const Color(0xFF03A9F4),
      const Color(0xFF8BC34A),
      const Color(0xFFFF5722),
    ];

    final totalGeral = viewModel.caixaPorCategoria
        .map((e) => e.total)
        .fold(0.0, (a, b) => a + b);

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 3,
              centerSpaceRadius: 50,
              pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (FlTouchEvent event, pieTouchResponse) {},
              ),
              sections: viewModel.caixaPorCategoria.asMap().entries.map((entry) {
                final idx = entry.key;
                final caixa = entry.value;
                final pct = totalGeral > 0
                    ? (caixa.total / totalGeral * 100)
                    : 0.0;
                return PieChartSectionData(
                  color: colors[idx % colors.length],
                  value: caixa.total,
                  title: '${pct.toStringAsFixed(0)}%',
                  radius: 35,
                  titleStyle: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  badgeWidget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      'R\$ ${caixa.total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: colors[idx % colors.length],
                      ),
                    ),
                  ),
                  badgePositionPercentageOffset: 1.3,
                );
              }).toList(),
            ),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutCubic,
          ),
        ),
        const SizedBox(height: 32), // More space for the badges
        // Legenda
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: viewModel.caixaPorCategoria.asMap().entries.map((entry) {
            final idx = entry.key;
            final caixa = entry.value;
            return _buildLegendItem(
              color: colors[idx % colors.length],
              label: caixa.categoria,
              value: 'R\$ ${caixa.total.toStringAsFixed(2)}',
            );
          }).toList(),
        ),
      ],
    );
  }

  // ========================================
  // HELPER WIDGETS
  // ========================================

  Widget _buildEmptyChart(String message) {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart_rounded,
              size: 48, color: Colors.grey.withValues(alpha: 0.3)),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$label ($value)',
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF78909C),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_rounded,
                size: 64, color: Color(0xFFB0BEC5)),
            const SizedBox(height: 16),
            Text(
              viewModel.errorMessage ?? 'Erro desconhecido',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF78909C),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _carregarDados,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Cor.azul,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================
  // FORMATAÇÃO
  // ========================================

  String _formatarNumero(int num) {
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    }
    return num.toString();
  }

  String _formatarData(String dataStr) {
    try {
      final date = DateTime.parse(dataStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
    } catch (_) {
      return dataStr.length > 10 ? dataStr.substring(0, 10) : dataStr;
    }
  }

  String _formatarDataCurta(String dataStr) {
    try {
      final date = DateTime.parse(dataStr);
      return '${date.day}/${date.month}';
    } catch (_) {
      return dataStr;
    }
  }
}