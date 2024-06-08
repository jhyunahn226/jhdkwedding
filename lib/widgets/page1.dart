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
        horizontal: Sizes.size20,
        vertical: Sizes.size32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/window.png',
              // width: 250,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color(0xFF434343),
                  width: 0.4,
                ),
                right: BorderSide(
                  color: Color(0xFF434343),
                  width: 0.4,
                ),
                bottom: BorderSide(
                  color: Color(0xFF434343),
                  width: 0.4,
                ),
              ),
            ),
            padding: const EdgeInsets.all(Sizes.size32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '" Keep Your Date "',
                    style: TextStyle(
                      fontFamily: 'Ownglyph-meetme',
                      fontSize: Sizes.size28,
                      height: 1.2,
                    ),
                  ),
                ),
                Gaps.v32,
                const Text(
                  '아! 저희는 결혼식을 따로 하지 않기로 했어요.',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.v24,
                const Text(
                  '저희가 이렇게 여러분께 청첩장을 보냈다는 것은, 저희의 삶에서 여러분과의 인연이 소중한 의미가 있었다는 뜻이에요.',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.v8,
                const Text(
                  '함께 학교나 직장을 다니며 일상을 공유했거나, 고민을 나눴던 사이이거나, 서로의 기쁨을 나의 일처럼 기뻐해줬던 기억이 있거나...',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.v24,
                const Text(
                  '그래서 이 글을 읽고 계시는 당신이라면, 굳이 결혼식을 하지 않더라도 충분히 마음으로 진심 어린 축하를 보내주실 거라는 걸 알거든요.',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.v24,
                RichText(
                  text: const TextSpan(
                    text:
                        '그리고 무엇보다도... 결혼식을 하면 저희는 분명 오열하느라 식이 제대로 진행되지 않을거에요. ',
                    style: TextStyle(
                      fontFamily: 'KyoboHandwriting2019',
                      fontSize: Sizes.size18,
                      color: ColorEnum.black,
                    ),
                    children: [
                      TextSpan(
                        text: '(상상만 해도 울컥한 걸 보면 확실해요)',
                        style: TextStyle(
                          color: ColorEnum.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v8,
                const Text(
                  '대신 이탈리아의 조용한 시골 마을에서 단둘이 소소한 세리머니를 하기로 했답니다.',
                  style: TextStyle(
                    fontFamily: 'KyoboHandwriting2019',
                    fontSize: Sizes.size18,
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
