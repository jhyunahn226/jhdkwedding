import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/constants.dart';
import 'package:jhdkwedding/constants/enum.dart';
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
import 'package:just_audio/just_audio.dart';
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
  bool _isMusicPlaying = false;
  bool _showGuide = true;
  final player = AudioPlayer();
  List<Map<String, dynamic>> _photos = [];

  final ScrollController _scrollController = ScrollController();
  // double _scrollPercentage = 0.0;

  final CarouselController _section1Controller = CarouselController();
  List<Map<String, dynamic>> _section1 = [];
  int _section1Slide = 0;

  final CarouselController _section2Controller = CarouselController();
  List<Map<String, dynamic>> _section2 = [];
  int _section2Slide = 0;

  final CarouselController _section3Controller = CarouselController();
  List<Map<String, dynamic>> _section3 = [];
  int _section3Slide = 0;

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
    await player.setUrl(
      'https://jdpuymhlqtfpzwbfzvvi.supabase.co/storage/v1/object/public/music/InSummer.mp3',
    );
    await player.setClip(start: const Duration(seconds: 5));

    _photos = await supabase.from('photos').select();
    _section1 = _photos.where((e) => e['section'] == 1).toList();
    _section2 = _photos.where((e) => e['section'] == 2).toList();
    _section3 = _photos.where((e) => e['section'] == 3).toList();

    /* Precache */
    if (!mounted) return;
    await precacheImage(
      Image.network(
        'https://jdpuymhlqtfpzwbfzvvi.supabase.co/storage/v1/object/public/photos/main.jpg',
      ).image,
      context,
    );
    if (!mounted) return;
    await precacheImage(
      Image.asset('assets/images/olaf_face.png').image,
      context,
    );

    // for (Map<String, dynamic> data in _photos) {
    //   if (!mounted) return;
    //   await precacheImage(NetworkImage(data['url']), context);
    // }

    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _showGuide = false;
      });
    });

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

  void _addLike({required int section, required int id}) {
    switch (section) {
      case 1:
        var item = _section1.firstWhere((element) => element['id'] == id);
        item['likes']++;
        break;
      case 2:
        var item = _section2.firstWhere((element) => element['id'] == id);
        item['likes']++;
        break;
      case 3:
        var item = _section3.firstWhere((element) => element['id'] == id);
        item['likes']++;
        break;
      default:
        return;
    }

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
                  child: Stack(
                    children: [
                      CustomScrollView(
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
                                      itemBuilder:
                                          (context, index, realIndex) =>
                                              Posting(
                                        section: 1,
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
                                        autoPlayAnimationDuration:
                                            const Duration(
                                          milliseconds: 500,
                                        ),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        onPageChanged: (index, reason) {
                                          setState(
                                            () => _section1Slide = index,
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: _section1
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          return GestureDetector(
                                            onTap: () => _section1Controller
                                                .animateToPage(
                                              entry.key,
                                            ),
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              width: Sizes.size8,
                                              height: Sizes.size8,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black)
                                                    .withOpacity(
                                                        _section1Slide ==
                                                                entry.key
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
                                      itemBuilder:
                                          (context, index, realIndex) =>
                                              Posting(
                                        section: 2,
                                        id: _section2[index]['id'],
                                        url: _section2[index]['url'],
                                        likes: _section2[index]['likes'],
                                        description: _section2[index]
                                            ['description'],
                                        addLike: _addLike,
                                      ),
                                      options: CarouselOptions(
                                        // height: 400,
                                        aspectRatio: 5 / 4,
                                        viewportFraction: 1,
                                        initialPage: _section2Slide,
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(
                                          milliseconds: 4000,
                                        ),
                                        autoPlayAnimationDuration:
                                            const Duration(
                                          milliseconds: 500,
                                        ),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        onPageChanged: (index, reason) {
                                          setState(
                                            () => _section2Slide = index,
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: _section2
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          return GestureDetector(
                                            onTap: () => _section2Controller
                                                .animateToPage(
                                              entry.key,
                                            ),
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              width: Sizes.size8,
                                              height: Sizes.size8,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black)
                                                    .withOpacity(
                                                        _section2Slide ==
                                                                entry.key
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
                                Stack(
                                  children: [
                                    CarouselSlider.builder(
                                      carouselController: _section3Controller,
                                      itemCount: _section3.length,
                                      itemBuilder:
                                          (context, index, realIndex) =>
                                              Posting(
                                        section: 3,
                                        id: _section3[index]['id'],
                                        url: _section3[index]['url'],
                                        likes: _section3[index]['likes'],
                                        description: _section3[index]
                                            ['description'],
                                        addLike: _addLike,
                                      ),
                                      options: CarouselOptions(
                                        // height: 400,
                                        aspectRatio: 5 / 4,
                                        viewportFraction: 1,
                                        initialPage: _section3Slide,
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(
                                          milliseconds: 4000,
                                        ),
                                        autoPlayAnimationDuration:
                                            const Duration(
                                          milliseconds: 500,
                                        ),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        onPageChanged: (index, reason) {
                                          setState(
                                            () => _section3Slide = index,
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: _section3
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          return GestureDetector(
                                            onTap: () => _section3Controller
                                                .animateToPage(
                                              entry.key,
                                            ),
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              width: Sizes.size8,
                                              height: Sizes.size8,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black)
                                                    .withOpacity(
                                                        _section3Slide ==
                                                                entry.key
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
                                const Page4(),
                                Gaps.v40,
                                // const Sponsor(),
                                // Gaps.v40,
                                Gallery(
                                  photos: _photos,
                                ),
                                const ShareWidget(),
                                const Footer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (_isMusicPlaying) {
                                  player.pause();
                                  _isMusicPlaying = false;
                                } else {
                                  player.play();
                                  _showGuide = false;
                                  _isMusicPlaying = true;
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                _isMusicPlaying
                                    ? Icons.volume_up_rounded
                                    : Icons.volume_off_rounded,
                              ),
                            ),
                            if (_showGuide)
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorEnum.lightgrey.withOpacity(0.8),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                  vertical: Sizes.size2,
                                ),
                                margin: const EdgeInsets.only(
                                  right: Sizes.size20,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/olaf_face.png',
                                      height: Sizes.size28,
                                    ),
                                    Gaps.h6,
                                    const Text(
                                      '누르면 기분이 좋아질 거에요! ▲',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'KyoboHandwriting2019',
                                        // color: ColorEnum.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
