import 'package:carousel_slider/carousel_slider.dart';
import 'package:dahiayguille/utils/colors.dart';
import 'package:flutter/material.dart';

class FotosPage extends StatefulWidget {
  const FotosPage({super.key});

  @override
  State<FotosPage> createState() => _FotosPageState();
}

class _FotosPageState extends State<FotosPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/foto1.jpeg',
      'assets/foto2.jpeg',
      'assets/foto3.jpeg',
      'assets/foto4.jpeg',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 1000;
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Retratos de Nuestro Amor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Un minuto, un segundo, un instante que queda en la eternidad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
            const SizedBox(height: 30),
            CarouselSlider.builder(
              itemCount: imageList.length,
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: isMobile ? 1 : 0.3,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final isCenter = index == _currentIndex;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Card(
                    elevation: isCenter ? 8 : 4,
                    color: isCenter ? AppColors.cardSelected : AppColors.card,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color:
                            isCenter ? AppColors.cardSelected : AppColors.card,
                        width: isCenter ? 2 : 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16.0,
                        16.0,
                        16.0,
                        80.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  imageList.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            entry.key == _currentIndex
                                ? AppColors.cardSelected
                                : Colors.grey.shade300,
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
