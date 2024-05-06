import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Posting extends StatefulWidget {
  final int id;
  final String url;
  final int likes;
  final String? description;
  const Posting({
    super.key,
    required this.id,
    required this.url,
    required this.likes,
    this.description,
  });

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(widget.url),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(Sizes.size10),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: Sizes.size20,
                  ),
                  Gaps.h6,
                  Text(
                    widget.likes.toString(),
                    style: const TextStyle(
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: Sizes.size10),
              child: Text(
                widget.description ?? '',
                style: const TextStyle(
                  fontFamily: 'KyoboHandwriting2019',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
