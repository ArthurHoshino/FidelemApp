import 'package:flutter/material.dart';
import 'package:fidelem_app/core/widgets/fid_text.dart';
import 'package:fidelem_app/core/widgets/fid_header.dart';
import 'package:fidelem_app/modules/home/components/home_ultimos.dart';
import 'package:fidelem_app/modules/home/components/home_promocoes.dart';
import 'package:fidelem_app/modules/home/components/home_banner.dart';
import 'package:fidelem_app/core/data/test/home_test_data.dart';

const double _horizontalPadding = 20.0;

class HomeViewCliente extends StatelessWidget {
  const HomeViewCliente({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bannersData = HomeTestData.banners;
    final List<Map<String, dynamic>> buscadosData = HomeTestData.ultimosBuscados;
    final List<Map<String, dynamic>> promocoesData = HomeTestData.promocoes;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            const FIDHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    HomeBanner(
                      bannerItems: bannersData,
                      heightFactor: 0.25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                      child: _buildUltimosBuscados(buscadosData),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                      child: _buildPromocoes(context, promocoesData),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUltimosBuscados(List<Map<String, dynamic>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Últimos Buscados",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: const Color.fromRGBO(97, 97, 97, 1),
          padding: const {"bottom": 0.0, "top": 0.0, "left": 0.0, "right": 0.0},
        ),
        const SizedBox(height: 8),
        ...data.map((item) => HomeUltimos(
          title: item["titulo"],
          subtitle: item["subtitulo"],
          imagePath: item["imagem"],
        )).toList(),
      ],
    );
  }

  Widget _buildPromocoes(BuildContext context, List<Map<String, dynamic>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        FIDText(
          baseText: "Promoções",
          preset: FIDText.medium,
          textAlign: TextAlign.left,
          color: const Color.fromRGBO(97, 97, 97, 1),
          padding: const {"bottom": 0.0, "top": 0.0, "left": 0.0, "right": 0.0},
        ),
        const SizedBox(height: 12),
        if (data.isEmpty)
          const Center(child: Text("Nenhuma promoção disponível."))
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = data[index];
              return HomePromocoes(
                title: item["titulo"],
                price: item["preco"],
                imagePath: item["imagem"],
                width: 1.0,
              );
            },
          ),
      ],
    );
  }
}