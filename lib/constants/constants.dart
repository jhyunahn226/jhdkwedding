import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client
final supabase = Supabase.instance.client;

/// Simple preloader inside a Center widget
const preloader = Center(
  child: CircularProgressIndicator(color: ColorEnum.bluegreen),
);

/// Basic theme to change the look and feel of the app
final appTheme = ThemeData(
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
    shape: LinearBorder(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: ColorEnum.white,
    surfaceTintColor: Colors.transparent,
  ),
  scrollbarTheme: const ScrollbarThemeData(
    thickness: WidgetStatePropertyAll(5),
  ),
);

/// Set of extension methods to easily display a snackbar
extension ShowSnackBar on BuildContext {
  /// Displays a basic snackbar
  void showSnackBar({
    required String message,
    Color backgroundColor = ColorEnum.darkgrey,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: ColorEnum.white),
      ),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackbar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

class IconButtonWithShadow extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;

  const IconButtonWithShadow({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        children: [
          // The shadow behind the icon
          Positioned(
            left: 2,
            top: 2,
            child: Icon(
              icon,
              color: Colors.black.withOpacity(0.5),
              size: 30,
            ),
          ),
          // The actual icon
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
