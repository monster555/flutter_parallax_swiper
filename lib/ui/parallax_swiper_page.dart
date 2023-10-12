import 'package:flutter/material.dart';
import 'package:flutter_parallax_swiper/ui/widgets/parallax_swiper.dart';

class ParallaxSwiperPage extends StatelessWidget {
  const ParallaxSwiperPage({super.key});

  /// List of image URLs to display in the slider.
  static const images = <String>[
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parallax Swiper'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Depth with Zoom and Fade'),
            ),
            // The following examples show how to use the ParallaxSwiper widget.
            SizedBox(
              height: 300,
              child: ParallaxSwiper(
                // List of image URLs to display
                images: images,
                // Fraction of the viewport for each image
                viewPortFraction: 0.85,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Pure Parallax Effect'),
            ),
            SizedBox(
              height: 300,
              child: ParallaxSwiper(
                // List of image URLs to display
                images: images,
                // Fraction of the viewport for each image
                viewPortFraction: 0.85,
                // Disable the background zoom effect
                backgroundZoomEnabled: false,
                // Disable the foreground fade effect
                foregroundFadeEnabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
