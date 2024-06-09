import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/constants.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:jhdkwedding/widgets/footer.dart';
import 'package:jhdkwedding/widgets/gallery.dart';
import 'package:jhdkwedding/widgets/page1.dart';
import 'package:jhdkwedding/widgets/page2.dart';
import 'package:jhdkwedding/widgets/page3.dart';
import 'package:jhdkwedding/widgets/page4.dart';
import 'package:jhdkwedding/widgets/posting.dart';
import 'package:jhdkwedding/widgets/share.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jdpuymhlqtfpzwbfzvvi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkcHV5bWhscXRmcHp3YmZ6dnZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzNjU1MDEsImV4cCI6MjAyOTk0MTUwMX0.Y1i7CQ2ZYnQ2rQNa99jLfbXVtpSrBH1tBwuTW-j__8g',
  );

  KakaoSdk.init(
    javaScriptAppKey: 'e2c3d60e13cadd32ee10154b420cf56f',
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
      theme: appTheme,
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

  final ScrollController _scrollController = ScrollController();
  // double _scrollPercentage = 0.0;

  final CarouselController _section1Controller = CarouselController();
  List<Map<String, dynamic>> _section1 = [];
  int _section1Slide = 0;

  final CarouselController _section2Controller = CarouselController();
  List<Map<String, dynamic>> _section2 = [];
  int _section2Slide = 0;

  @override
  void initState() {
    super.initState();
    _getDatabase();
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _getDatabase() async {
    _section1 = await supabase.from('photos').select().eq('section', 1);
    _section2 = await supabase.from('photos').select().eq('section', 2);

    /* Precache */
    // for (Map<String, dynamic> data in _section1) {
    //   if (!mounted) return;
    //   await precacheImage(Image.network(data['url']).image, context);
    // }
    if (!mounted) return;
    await precacheImage(
      Image.network(
        'https://jdpuymhlqtfpzwbfzvvi.supabase.co/storage/v1/object/public/photos/main.jpg',
      ).image,
      context,
    );
    setState(() {
      _isLoading = false;
    });
  }

  // void _scrollListener() {
  //   double maxScroll = _scrollController.position.maxScrollExtent;
  //   double currentScroll = _scrollController.position.pixels;
  //   double percentage = currentScroll / maxScroll;
  //   setState(() {
  //     _scrollPercentage = percentage.isFinite ? percentage : 0.0;
  //   });
  // }

  void _addLike(int id) {
    var item = _section1.firstWhere((element) => element['id'] == id);
    item['likes']++;
    setState(() {});
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
                  const Text('Loading...'),
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/photos/paper.jpg',
                      ),
                    ),
                  ),
                  // color: ColorEnum.background,
                  child: CustomScrollView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Image.network(
                          'https://jdpuymhlqtfpzwbfzvvi.supabase.co/storage/v1/object/public/photos/main.jpg',
                        ),
                      ),
                      // SliverPersistentHeader(
                      //   pinned: true,
                      //   delegate: StickyHeaderDelegate(
                      //     height: Sizes.size40,
                      //     child: Container(
                      //       decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //           fit: BoxFit.cover,
                      //           image: AssetImage(
                      //             'assets/photos/paper.jpg',
                      //           ),
                      //         ),
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           LayoutBuilder(
                      //             builder: (BuildContext context,
                      //                 BoxConstraints constraints) {
                      //               double indicatorSize =
                      //                   Sizes.size60; //인디케이터 전체 너비
                      //               double translateValue =
                      //                   constraints.maxWidth *
                      //                           _scrollPercentage -
                      //                       indicatorSize / 2; //인디케이터를 이동시킬 거리

                      //               return Transform.translate(
                      //                 offset: Offset(translateValue, 0),
                      //                 child: Align(
                      //                   alignment: Alignment.centerLeft,
                      //                   child: SizedBox(
                      //                     width: indicatorSize,
                      //                     child: const Column(
                      //                       children: [
                      //                         Text(
                      //                           'HI',
                      //                           style: TextStyle(
                      //                             color: ColorEnum.bluegreen,
                      //                             fontSize: Sizes.size14,
                      //                             fontWeight: FontWeight.w700,
                      //                             height: 0,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               );
                      //             },
                      //           ),
                      //           LinearPercentIndicator(
                      //             percent: _scrollPercentage,
                      //             progressColor: ColorEnum.darkgreen,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            const Page1(),
                            Stack(
                              children: [
                                CarouselSlider.builder(
                                  carouselController: _section1Controller,
                                  itemCount: _section1.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Posting(
                                    id: _section1[index]['id'],
                                    url: _section1[index]['url'],
                                    likes: _section1[index]['likes'],
                                    description: _section1[index]
                                        ['description'],
                                    addLike: _addLike,
                                  ),
                                  options: CarouselOptions(
                                    // height: 400,
                                    aspectRatio: 5 / 4,
                                    viewportFraction: 1,
                                    initialPage: _section1Slide,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(
                                      milliseconds: 4000,
                                    ),
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 500,
                                    ),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    onPageChanged: (index, reason) {
                                      setState(() => _section1Slide = index);
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        _section1.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () =>
                                            _section1Controller.animateToPage(
                                          entry.key,
                                        ),
                                        behavior: HitTestBehavior.opaque,
                                        child: Container(
                                          width: Sizes.size8,
                                          height: Sizes.size8,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black)
                                                .withOpacity(
                                                    _section1Slide == entry.key
                                                        ? 0.9
                                                        : 0.4),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const Page2(),
                            Stack(
                              children: [
                                CarouselSlider.builder(
                                  carouselController: _section2Controller,
                                  itemCount: _section2.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Posting(
                                    id: _section2[index]['id'],
                                    url: _section2[index]['url'],
                                    likes: _section2[index]['likes'],
                                    description: _section2[index]
                                        ['description'],
                                    addLike: _addLike,
                                  ),
                                  options: CarouselOptions(
                                    // height: 400,
                                    aspectRatio: 3 / 5,
                                    viewportFraction: 1,
                                    initialPage: _section2Slide,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(
                                      milliseconds: 4000,
                                    ),
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 500,
                                    ),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    onPageChanged: (index, reason) {
                                      setState(() => _section2Slide = index);
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        _section2.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () =>
                                            _section2Controller.animateToPage(
                                          entry.key,
                                        ),
                                        behavior: HitTestBehavior.opaque,
                                        child: Container(
                                          width: Sizes.size8,
                                          height: Sizes.size8,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: (Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black)
                                                .withOpacity(
                                                    _section2Slide == entry.key
                                                        ? 0.9
                                                        : 0.4),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const Page3(),
                            CarouselSlider.builder(
                              itemCount: _section1.length,
                              itemBuilder: (context, index, realIndex) =>
                                  Posting(
                                id: _section1[index]['id'],
                                url: _section1[index]['url'],
                                likes: _section1[index]['likes'],
                                description: _section1[index]['description'],
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
                            const Page4(),
                            Gaps.v40,
                            const Gallery(),
                            Gaps.v40,
                            const ShareWidget(),
                            const Footer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  StickyHeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
