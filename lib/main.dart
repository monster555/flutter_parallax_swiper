import 'package:flutter/material.dart';
import 'package:flutter_parallax_swiper/ui/parallax_swiper_page.dart';

void main() => runApp(const MyApp());

/// The main application widget.
///
/// This widget represents the root of the Flutter application. It configures
/// the overall theme and sets the initial route to [ParallaxSwiperPage].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parallax Swiper',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const ParallaxSwiperPage(),
    );
  }
}
