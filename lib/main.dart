import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/photos/1.jpg'),
                  Image.asset('assets/photos/2.jpg'),
                  Image.asset('assets/photos/3.jpg'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
