import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Sizes.size40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '복사기도 아는 사내연애라지만, 무려 5년 동안이나 비밀을 지키려 얼마나 노력했는지 몰라요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          Text(
            '회사 근처 동네에 좋은 데이트코스가 많은데, 혹시나 동료를 마주칠까봐 대부분 가보지도 못했답니다. (실제로 몇 번 마주친 적도 있어요...)',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          Text(
            '그래도 이제는 공식적으로 결혼 발표를 해서, 너무 감사하게도 많은 분들의 축하와 응원을 받고 있어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          Text(
            '연인끼리 같은 회사에 다니면 어떤 느낌이냐고 물어보는 분들이 많은데, 사실 좋은 점이 너무너무 많아요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          Text(
            '회사에서 있었던 재밌는 에피소드를 이야기했을 때 같이 깔깔대며 공감할 수 있고, 갑작스럽게 야근을 하는 일이 생기더라도 이해해줄 수 있죠.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size16,
            ),
          ),
          Gaps.v20,
          Text(
            '소소한 일상을 100% 공유할 수 있으니까, 더 재미있게 알콩달콩 지내는 것 같아요.',
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
