import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class GalleryCarouselScreen extends StatefulWidget {
  final List<Map<String, dynamic>> photos;
  final int index;

  const GalleryCarouselScreen({
    super.key,
    required this.photos,
    required this.index,
  });

  @override
  State<GalleryCarouselScreen> createState() => _GalleryCarouselScreenState();
}

class _GalleryCarouselScreenState extends State<GalleryCarouselScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CarouselSlider.builder(
        itemCount: widget.photos.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          Map<String, dynamic> photo = widget.photos[itemIndex];
          return Padding(
            padding: const EdgeInsets.all(Sizes.size8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  photo['url'],
                  fit: BoxFit.contain,
                ),
                Container(
                  color: ColorEnum.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                size: Sizes.size20,
                                color: ColorEnum.red,
                              ),
                              Gaps.h6,
                              Text(
                                photo['likes'].toString(),
                                style: const TextStyle(
                                  fontSize: Sizes.size12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          photo['description'] ?? '',
                          style: const TextStyle(
                            fontFamily: 'KyoboHandwriting2019',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          initialPage: _currentIndex,
          viewportFraction: 1,
          aspectRatio: 1 / 2,
          onPageChanged: (newIndex, reason) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
