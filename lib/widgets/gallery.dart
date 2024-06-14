import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jhdkwedding/constants/constants.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Gallery extends StatefulWidget {
  final List<Map<String, dynamic>> photos;
  const Gallery({
    required this.photos,
    super.key,
  });

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final supabase = Supabase.instance.client;

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  void _onPhotoTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: widget.photos.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    Map<String, dynamic> photo = widget.photos[itemIndex];
                    return Padding(
                      padding: const EdgeInsets.all(Sizes.size8),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    aspectRatio: min(MediaQuery.of(context).size.width, 500) /
                        MediaQuery.of(context).size.height,
                    onPageChanged: (newIndex, reason) {
                      setDialogState(() {
                        _currentIndex = newIndex;
                      });
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.size20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height / 2.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(_currentIndex + 1).toString()} / ${widget.photos.length.toString()}',
                              style: const TextStyle(
                                color: ColorEnum.white,
                              ),
                            ),
                            IconButtonWithShadow(
                              onPressed: () =>
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(),
                              icon: Icons.close,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonWithShadow(
                          onPressed: () {
                            if (_currentIndex > 0) {
                              _carouselController.animateToPage(
                                _currentIndex - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _carouselController.animateToPage(
                                widget.photos.length - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          icon: Icons.chevron_left,
                        ),
                        IconButtonWithShadow(
                          onPressed: () {
                            if (_currentIndex < widget.photos.length - 1) {
                              _carouselController.animateToPage(
                                _currentIndex + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _carouselController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          icon: Icons.chevron_right,
                        ),
                      ],
                    ),
                    const SizedBox(height: Sizes.size80),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: Sizes.size60,
          child: Divider(
            color: ColorEnum.black,
          ),
        ),
        Gaps.v10,
        const Text(
          'GALLERY',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.v20,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: widget.photos.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => _onPhotoTap(index),
            child: Image.network(
              widget.photos[index]['url'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
