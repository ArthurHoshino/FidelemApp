import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fidelem_app/core/tema/tema.dart';

class FidBanner extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final double heightFactor;

  const FidBanner({
    super.key,
    required this.items,
    this.heightFactor = 0.25,
  });

  @override
  State<FidBanner> createState() => _FidBannerState();
}

class _FidBannerState extends State<FidBanner> {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bannerHeight = screenHeight * widget.heightFactor;

    if (widget.items.isEmpty) return const SizedBox.shrink();

    return Container(
      height: bannerHeight,
      width: double.infinity,
      color: Cor.azulClaro1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: widget.items.length,
            options: CarouselOptions(
              height: bannerHeight,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) => setState(() => currentIndex = index),
            ),
            itemBuilder: (context, index, realIndex) {
              final item = widget.items[index];
              final String title = item["titulo"] ?? "";
              final String imagePath = item["imagem"] ?? "";

              return Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: imagePath.isNotEmpty
                          ? Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image, size: 80, color: Cor.azul);
                              },
                            )
                          : const Icon(Icons.image, size: 80, color: Cor.azul),
                    ),

                    const SizedBox(height: 10),
                    
                    Flexible(
                      flex: 1,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Cor.preto,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Cor.azul),
              onPressed: controller.previousPage,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Cor.azul),
              onPressed: controller.nextPage,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.asMap().entries.map((entry) {
                bool isActive = currentIndex == entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 16.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: isActive ? Cor.azul : Cor.azulClaro2,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}