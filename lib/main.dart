import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/sizes.dart';

void main() {
  runApp(const JHDKWedding());
}

class JHDKWedding extends StatelessWidget {
  const JHDKWedding({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JHDK Wedding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
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
      ),
      home: const MainScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            if (pointerSignal.scrollDelta.dy > 0 && _pageController.page! < 2) {
              // 아래로 스크롤
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else if (pointerSignal.scrollDelta.dy < 0 &&
                _pageController.page! > 0) {
              // 위로 스크롤
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: kIsWeb
              ? const NeverScrollableScrollPhysics()
              : const PageScrollPhysics(),
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/photos/1.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            Container(
              child: const Center(
                child: Text('두번째 페이지'),
              ),
            ),
            Container(
              child: const Center(
                child: Text('세번째 페이지'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
