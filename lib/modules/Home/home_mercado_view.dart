import 'package:flutter/material.dart';
import 'package:fidelem_app/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const Color azul = Color(0xFF006FFD);
  static const Color cinza = Color(
    0xFF717375,
  ); // cor dos ícones não selecionados
  int currentIndex = 1;

  final List<Map<String, String>> promotions = [
    {"title": "Abacaxi Pérola Peça", "price": "R\$ 12,00", "points": "600 pts"},
    {
      "title": "Presunto Magro Oval Tradicional",
      "price": "R\$ 4,58",
      "points": "200 pts",
    },
    {
      "title": "Macarrão Parafuso com Ovos Todeschini 500g",
      "price": "R\$ 2,99",
      "points": "150 pts",
    },
    {
      "title": "Arroz Tipo 1 Pilecco Nobre 5kg",
      "price": "R\$ 29,69",
      "points": "800 pts",
    },
    {
      "title": "Açúcar Cristal Especial D’Ouro 5kg",
      "price": "R\$ 14,98",
      "points": "680 pts",
    },
    {
      "title": "Creme Dental Total Ação Colgate 90g",
      "price": "R\$ 5,39",
      "points": "220 pts",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo à esquerda e texto centralizado
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "lib/core/assets/registro/Logo_FidelemApp_2.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Text(
                      "Fidelem App",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Produtos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Pesquise por algum produto...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: const Color(0xFFF0F0F0),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE6E8EE)),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.filter_list,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Filtrar",
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(width: 8),
                              _Badge(text: "2", color: azul),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: azul,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // ação de adicionar
                          },
                          child: const Text("Adicionar"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: promotions.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.95,
                          ),
                      itemBuilder: (context, index) {
                        final item = promotions[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F9FE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // ✅ alinhamento à esquerda
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDADADA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // ✅ alinhamento à esquerda
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.5,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "${item["price"]} | ",
                                            ),
                                            TextSpan(
                                              text: item["points"],
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ BottomNavigationBar com fundo branco e ícones azul/cinza
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: azul,
        unselectedItemColor: cinza,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 0) {
            // ação de adicionar
          } else if (index == 1) {
            // ação de home
          } else if (index == 2) {
            Navigator.pushNamed(context, Routes.configPage);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adicionar produto",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configuração",
          ),
        ],
      ),
    );
  }
}

// Badge com cor personalizada
class _Badge extends StatelessWidget {
  final String text;
  final Color color;
  const _Badge({required this.text, this.color = Colors.black12});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
