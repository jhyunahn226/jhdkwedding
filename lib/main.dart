import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:jhdkwedding/widgets/posting.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jdpuymhlqtfpzwbfzvvi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkcHV5bWhscXRmcHp3YmZ6dnZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzNjU1MDEsImV4cCI6MjAyOTk0MTUwMX0.Y1i7CQ2ZYnQ2rQNa99jLfbXVtpSrBH1tBwuTW-j__8g',
  );
  runApp(const JHDKWedding());
}

class JHDKWedding extends StatelessWidget {
  const JHDKWedding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JHDK Wedding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Pretendard',
          primaryColor: ColorEnum.white,
          splashFactory: NoSplash.splashFactory,
          scaffoldBackgroundColor: ColorEnum.white,
          dialogBackgroundColor: ColorEnum.white,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: ColorEnum.white,
            foregroundColor: ColorEnum.black,
          ),
          dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.transparent,
            backgroundColor: ColorEnum.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: ColorEnum.white,
            surfaceTintColor: Colors.transparent,
          ),
          scrollbarTheme: const ScrollbarThemeData(
            thickness: MaterialStatePropertyAll(5),
          )),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> _data = [];
  @override
  void initState() {
    super.initState();
    _getDatabase();
  }

  void _getDatabase() async {
    _data = await Supabase.instance.client.from('photos').select();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            color: ColorEnum.background,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/photos/onboarding1.jpg'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size48,
                      vertical: Sizes.size60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "김다경과 안재현이\n여러분의 '마음'을 초대합니다.",
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
                        Gaps.v20,
                        const Text(
                          '일정이 바빠서 못가게 되는 때도 있고, 가더라도 사람이 너무 많아 인사도 제대로 못하고 오는 경우도 있고 말이죠.',
                          style: TextStyle(
                            fontFamily: 'KyoboHandwriting2019',
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.v20,
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
                                text:
                                    ' 여러분의 축하의 마음이 담긴 따뜻한 연락 한 통이면 충분할 것 같아요.',
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
                  ),
                  CarouselSlider(
                    items: _data
                        .map(
                          (e) => Posting(url: e['url']),
                        )
                        .toList(),
                    options: CarouselOptions(
                      // height: 400,
                      aspectRatio: 5 / 4,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(
                        milliseconds: 4000,
                      ),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 500,
                      ),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
