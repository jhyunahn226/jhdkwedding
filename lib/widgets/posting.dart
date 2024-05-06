import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Posting extends StatelessWidget {
  final String url;
  const Posting({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(url),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.size10),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: Sizes.size20,
                  ),
                  Gaps.h6,
                  Text(
                    '96',
                    style: TextStyle(
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.size10),
              child: Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: Sizes.size20,
                  ),
                  Gaps.h6,
                  Text(
                    '3',
                    style: TextStyle(
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
