import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
          RichText(
            text: const TextSpan(
              text: '청첩장에 ',
              style: TextStyle(
                fontFamily: 'KyoboHandwriting2019',
                fontSize: Sizes.size18,
                color: ColorEnum.black,
                decoration: TextDecoration.none,
              ),
              children: [
                TextSpan(
                  text: '(비현실적인)',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
                    color: ColorEnum.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                  children: [
                    TextSpan(
                      text: ' 웨딩 사진들만 넣는 건 재미 없을 것 같아서',
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
            '지난 5년 간 함께했던 일상 속 사진들도 넣어봤어요. 덕분에 오랜만에 과거 사진들을 쭉 살펴봤네요!',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v24,
          const Text(
            '복사기도 아는 사내연애라지만, 무려 5년 동안이나 비밀을 지키려 얼마나 노력했는지 몰라요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          const Text(
            '회사 근처 동네에 좋은 데이트코스가 많은데, 혹시나 동료를 마주칠까봐 대부분 가보지도 못했죠. (최근에 공식적으로 결혼을 발표 이후로 열심히 다니고 있어요. 한 푸는 중!)',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v24,
          const Text(
            '연인끼리 같은 회사에 다니면 어떤 느낌이냐고 물어보는 분들이 많은데, 사실 좋은 점이 너무너무 많아요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v8,
          const Text(
            '회사에서 있었던 재밌는 에피소드를 이야기했을 때 같이 깔깔대며 공감할 수 있고, 갑작스럽게 야근을 하는 일이 생기더라도 이해해줄 수 있죠.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
        ],
      ),
    );
  }
}
