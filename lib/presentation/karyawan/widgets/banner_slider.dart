import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> banners = [
    'assets/images/product.jpg',
    'assets/images/product.jpg',
    'assets/images/product.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    banners[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: banners.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _current == entry.key ? 20.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: _current == entry.key
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.2),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
