import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
            '5년 간의 연애 끝에 저희가 결국 결혼을 합니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v20,
          Text(
            '복사기도 아는 사내연애라지만, 무려 5년 동안이나 비밀을 지키려 노력했어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          Text(
            '혹시나 싸우기라도 하면 회사에서 표정관리 안될까봐 걱정했는데, 신기하게도 저희는 5년 동안 단 한번도 싸우지 않았답니다.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Gaps.v10,
          Text(
            '결혼은 현실이라고 같이 살면 싸울 수 밖에 없다던데, 그래도 이 사람이라면 슬기롭게 헤쳐나갈 수 있을 거란 확신이 들어요.',
            style: TextStyle(
              fontFamily: 'KyoboHandwriting2019',
              fontSize: Sizes.size18,
            ),
          ),
          Text(
            '맛있는 거 먹고 풀면 되죠 뭐! 그게 인생 아닐까요?',
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
