import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:jhdkwedding/widgets/page1.dart';
import 'package:jhdkwedding/widgets/page2.dart';
import 'package:jhdkwedding/widgets/posting.dart';
import 'package:lottie/lottie.dart';
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
  bool _isLoading = true;
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _getDatabase();
  }

  void _getDatabase() async {
    _data = await Supabase.instance.client.from('photos').select();
    for (Map<String, dynamic> data in _data) {
      if (!mounted) return;
      await precacheImage(Image.network(data['url']).image, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _addLike(int id) {
    var item = _data.firstWhere((element) => element['id'] == id);
    item['likes']++;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lotties/loading.json',
                    width: Sizes.size150,
                  ),
                  const Text('Loading'),
                ],
              ),
            )
          : SafeArea(
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
                        Image.asset('assets/photos/onboarding3.jpg'),
                        const Page1(),
                        CarouselSlider.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index, realIndex) => Posting(
                            id: _data[index]['id'],
                            url: _data[index]['url'],
                            likes: _data[index]['likes'],
                            description: _data[index]['description'],
                            addLike: _addLike,
                          ),
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
                        const Page2(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
