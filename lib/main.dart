import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
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

class JHDKWedding extends StatefulWidget {
  const JHDKWedding({super.key});

  @override
  State<JHDKWedding> createState() => _JHDKWeddingState();
}

class _JHDKWeddingState extends State<JHDKWedding> {
  @override
  void initState() {
    super.initState();
    _getDatabase();
  }

  void _getDatabase() async {
    final data = await Supabase.instance.client.from('photos').select();
  }

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
