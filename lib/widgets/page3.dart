import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: Sizes.size48,
        right: Sizes.size48,
        bottom: Sizes.size52,
        top: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '복사기도 아는 사내연애라지만, 무려 5년 동안이나 비밀을 지키려 얼마나 노력했는지 몰라요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          Text(
            '회사 근처 동네를 다닐 때면 혹시나 동료를 마주칠까봐 사주경계를 하느라 힘들었는데, 공식적으로 결혼 발표를 한 최근에서야 좀 맘 편히 다니고 있답니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v24,
          Text(
            '연인끼리 같은 회사에 다니면 어떤 느낌이냐고 물어보는 분들이 많은데, 사실 좋은 점이 너무너무 많아요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          Text(
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
