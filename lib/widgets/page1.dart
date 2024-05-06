import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size48,
        vertical: Sizes.size52,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "김다경과 안재현이\n여러분의 '마음' 을 초대합니다.",
            style: TextStyle(
              fontFamily: 'Ownglyph-meetme',
              fontSize: Sizes.size28,
              height: 1.2,
            ),
          ),
          Gaps.v20,
          const Text(
            '아! 우선 저희는 결혼식을 따로 하지 않기로 했어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v20,
          const Text(
            '저희도 결혼식을 많이 초대받아봤지만, 곤란한 상황이 종종 생기더라라고요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          const Text(
            '일정이 바빠서 못가게 되는 때도 있고, 가더라도 사람이 너무 많아 인사도 제대로 못하고 오는 경우도 있고 말이죠.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          const Text(
            '그럴 때 마다 축하하는 마음을 100% 전달하지 못한 것 같아 아쉬움이 남더군요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v20,
          const Text(
            '저희도 그 마음 잘 알기에, 식을 올리지 않는 대신\n이탈리아의 조용한 시골 마을에서 단 둘이 소소한 세리머니를 하기로 했습니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v20,
          RichText(
            text: const TextSpan(
              text: '(직접 오셔서 축하해 주셔도 되고)',
              style: TextStyle(
                fontFamily: 'KyoboHandwriting2019',
                fontSize: Sizes.size18,
                color: ColorEnum.grey,
                decoration: TextDecoration.lineThrough,
              ),
              children: [
                TextSpan(
                  text: ' 여러분의 축하의 마음이 담긴 따뜻한 연락 한 통이면 충분할 것 같아요.',
                  style: TextStyle(
                    color: ColorEnum.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
