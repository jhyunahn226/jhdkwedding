import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size48,
        right: Sizes.size48,
        bottom: Sizes.size52,
        top: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "안재현스럽게, 김다경스럽게,",
            style: TextStyle(
              fontFamily: 'Ownglyph-meetme',
              fontSize: Sizes.size28,
              height: 1.2,
            ),
          ),
          Gaps.v24,
          const Text(
            "이제 부부의 연으로 앞으로도 소소한 행복으로 가득한, '저희다운' 삶을 함께 만들어 가보려 합니다.",
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v24,
          const Text(
            '그리고 저희만 행복한 삶이 아닌, 여러분처럼 소중한 분들의 행복에도 보탬이 되는 삶을 살아보려구요!',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v24,
          const Text(
            '저희의 다짐을 사랑의 이름으로 지켜나갈 수 있도록 앞날을 축복해 주시면 감사드리겠습니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v24,
          const Text(
            '저희 예쁘게 잘 살게요!',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/shinchan_olaf.png',
                width: Sizes.size100,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2024.09.06 ~',
                    style: TextStyle(
                      fontFamily: 'KyoboHandwriting2019',
                      fontSize: Sizes.size16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '김다경 & 안재현 드림.',
                    style: TextStyle(
                      fontFamily: 'KyoboHandwriting2019',
                      fontSize: Sizes.size16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
