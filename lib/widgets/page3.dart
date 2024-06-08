import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.size40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: '청첩장에 ',
              style: TextStyle(
                fontFamily: 'KyoboHandwriting2019',
                fontSize: Sizes.size16,
                color: ColorEnum.black,
                decoration: TextDecoration.none,
              ),
              children: [
                TextSpan(
                  text: '(비현실적인)',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size16,
                    color: ColorEnum.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                  children: [
                    TextSpan(
                      text: ' 웨딩 사진들만 넣는 건 재미 없을 것 같아서,',
                      style: TextStyle(
                        color: ColorEnum.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            '지난 5년 간 함께했던 일상 속 사진들도 넣어봤어요. 드레스 입은 사진과는 많이 다르죠?',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          const Text(
            '다경이는 평소에 힙해보이고 싶어서 이런 옷들을 즐겨입는데, 아무리 힙한 옷을 입어도 귀엽게 소화해내서 항상 놀리고 있어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          const Text(
            '복사기도 아는 사내연애라지만, 무려 5년 동안이나 비밀을 지키려 얼마나 노력했는지 몰라요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          const Text(
            '회사 근처 동네에 좋은 데이트코스가 많은데, 혹시나 동료를 마주칠까봐 대부분 가보지도 못했죠. 덕분에 사진들도 전부 먼 동네에서 찍은 것들 뿐이네요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          const Text(
            '연인끼리 같은 회사에 다니면 어떤 느낌이냐고 물어보는 분들이 많은데, 사실 좋은 점이 너무너무 많아요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          const Text(
            '회사에서 있었던 재밌는 에피소드를 이야기했을 때 같이 깔깔대며 공감할 수 있고, 갑작스럽게 야근을 하는 일이 생기더라도 이해해줄 수 있죠.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
        ],
      ),
    );
  }
}
