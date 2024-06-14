//https://qr.kakaopay.com/Ej8NFl3qZ

import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Sponsor extends StatelessWidget {
  const Sponsor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: Sizes.size60,
          child: Divider(
            color: ColorEnum.black,
          ),
        ),
        Gaps.v10,
        Text(
          '마음만으로는-부족해',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.v20,
      ],
    );
  }
}
