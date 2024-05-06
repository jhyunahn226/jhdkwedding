import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class Posting extends StatefulWidget {
  final int id;
  final String url;
  final int likes;
  final String? description;
  final Function addLike;
  const Posting({
    super.key,
    required this.id,
    required this.url,
    required this.likes,
    this.description,
    required this.addLike,
  });

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  bool _isLikeTouched = false;
  late int _likes;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.network(widget.url),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _likes++;
                      widget.addLike(widget.id);
                      setState(() => _isLikeTouched = true);
                      Timer(const Duration(milliseconds: 3200), () {
                        if (!mounted) return;
                        setState(() => _isLikeTouched = false);
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: Sizes.size20,
                          color: ColorEnum.red,
                        ),
                        Gaps.h6,
                        Text(
                          _likes.toString(),
                          style: const TextStyle(
                            fontSize: Sizes.size12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.description ?? '',
                    style: const TextStyle(
                      fontFamily: 'KyoboHandwriting2019',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_isLikeTouched)
          Positioned(
            left: -12,
            bottom: Sizes.size32,
            child: IgnorePointer(
              ignoring: true,
              child: Lottie.asset(
                'assets/lotties/like.json',
                width: Sizes.size80,
              ),
            ),
          ),
      ],
    );
  }
}
