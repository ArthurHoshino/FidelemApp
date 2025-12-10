import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LojaBanner extends StatefulWidget {
  final List<Map<String, dynamic>> bannerItems;
  final double heightFactor;

  const LojaBanner({
    super.key,
    required this.bannerItems,
    this.heightFactor = 0.25,
  });

  @override
  State<LojaBanner> createState() => _LojaBannerState();
}

class _LojaBannerState extends State<LojaBanner> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bannerHeight = screenHeight * widget.heightFactor;

    if (widget.bannerItems.isEmpty) return const SizedBox.shrink();

    return Container(
      height: bannerHeight,
      width: double.infinity,
      color: const Color.fromRGBO(235, 245, 255, 1),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.bannerItems.length,
            options: CarouselOptions(
              height: bannerHeight,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) => setState(() => _currentIndex = index),
            ),
            itemBuilder: (context, index, realIndex) {
              final item = widget.bannerItems[index];
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
                                return const Icon(Icons.image, size: 80, color: Color.fromRGBO(33, 150, 243, 1));
                              },
                            )
                          : const Icon(Icons.image, size: 80, color: Color.fromRGBO(33, 150, 243, 1)),
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
                          color: Color.fromRGBO(0, 0, 0, 0.867)
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
              icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(33, 150, 243, 1)),
              onPressed: _controller.previousPage,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(33, 150, 243, 1)),
              onPressed: _controller.nextPage,
            ),
          ),

          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.bannerItems.asMap().entries.map((entry) {
                bool isActive = _currentIndex == entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 16.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: isActive ? const Color.fromRGBO(33, 150, 243, 1) : const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.2),
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