import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.size56,
      color: ColorEnum.darkgrey,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Copyright ©FCCF. All Rights Reserved.',
            style: TextStyle(
              color: ColorEnum.lightgrey,
              fontSize: Sizes.size12,
            ),
          ),
          Gaps.v2,
          Text(
            'Made by JHyun & D.A.Komm',
            style: TextStyle(
              color: ColorEnum.lightgrey,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
    );
  }
}
