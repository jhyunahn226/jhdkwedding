import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
            "그래서 김다경과 안재현이\n여러분의 '마음'을 초대합니다.",
            style: TextStyle(
              fontFamily: 'Ownglyph-meetme',
              fontSize: Sizes.size28,
              height: 1.2,
            ),
          ),
          Gaps.v24,
          const Text(
            '2024년 9월 6일이에요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          RichText(
            text: const TextSpan(
              text: '(이탈리아에 직접 오셔서 축하해 주셔도 되고)',
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
          Gaps.v24,
          const Text(
            '아, 그런데 왜 하필 9월 6일이냐?!',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          const Text(
            '그 날이 저희가 처음 연애를 시작한 날짜거든요. 2019년부터 만남을 이어왔으니 벌써 5년이 되었네요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v24,
          const Text(
            '신기하게도 저희는 5년 동안 단 한번도 싸우지 않았답니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          const Text(
            '결혼은 현실이라고 같이 살면 싸울 수 밖에 없다던데, 그래도 이 사람이라면 슬기롭게 헤쳐나갈 수 있을 거란 확신이 들어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          const Text(
            '맛있는 거 먹고 풀면 되죠 뭐! 그게 인생 아닐까요?',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          const Text(
            '(다경이는 부대찌개나 LA갈비만 먹으면 그렇게 웃음이 난대요)',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
              color: ColorEnum.grey,
            ),
          ),
        ],
      ),
    );
  }
}
