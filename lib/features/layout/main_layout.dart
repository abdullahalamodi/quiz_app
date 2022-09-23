import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/features/layout/widgets/bottom_nav_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    Key? key,
    required this.body,
    this.appBar,
    this.title,
    this.showNavBar = true,
  }) : super(key: key);
  final Widget body;
  final PreferredSizeWidget? appBar;
  final String? title;
  final bool showNavBar;

  @override
  Widget build(BuildContext context) {
    // set status bar color and brightness
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light, // for android
        statusBarIconBrightness: Brightness.dark, // for ios
      ),
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: showNavBar ? const BottomNavBar() : null,
      ),
    );
  }
}
