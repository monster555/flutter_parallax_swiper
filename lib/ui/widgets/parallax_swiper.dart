import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_parallax_swiper/config/drag_scroll_behavior_configuration.dart';

class ParallaxSwiper extends StatefulWidget {
  /// A widget that displays a parallax swiper with multiple images.
  ///
  /// The [ParallaxSwiper] widget allows you to create a horizontal swiper that
  /// displays a list of images with parallax scrolling effects. You can customize
  /// its behavior by providing a list of image URLs, enabling or disabling
  /// drag-to-scroll functionality, setting the viewport fraction, adjusting padding,
  /// controlling the parallax factor, and toggling foreground fading and background zoom.
  ///
  /// Example 1: Using [ParallaxSwiper] with Default Values (Foreground Fading and Background Zoom Enabled):
  ///
  /// ```dart
  /// ParallaxSwiper(
  ///   images: [
  ///     'image_url_1.jpg',
  ///     'image_url_2.jpg',
  ///     'image_url_3.jpg',
  ///   ],
  /// )
  /// ```
  ///
  /// Example 2: Using [ParallaxSwiper] with No Foreground Fading and No Background Zoom:
  ///
  /// ```dart
  /// ParallaxSwiper(
  ///   images: [
  ///     'image_url_1.jpg',
  ///     'image_url_2.jpg',
  ///     'image_url_3.jpg',
  ///   ],
  ///   dragToScroll: true,
  ///   viewPortFraction: 0.85,
  ///   padding: EdgeInsets.all(16.0),
  ///   parallaxFactor: 10.0,
  ///   foregroundFadeEnabled: false, // Disable foreground image fading.
  ///   backgroundZoomEnabled: false, // Disable background image zooming.
  /// )
  /// ```
  const ParallaxSwiper({
    super.key,
    required this.images,
    this.dragToScroll = true,
    this.viewPortFraction = 1,
    this.padding = const EdgeInsets.all(8.0),
    this.parallaxFactor = 10.0,
    this.foregroundFadeEnabled = true,
    this.backgroundZoomEnabled = true,
  });

  /// A list of image URLs to display in the parallax swiper.
  final List<String> images;

  /// A flag that determines whether drag-to-scroll functionality is enabled.
  final bool dragToScroll;

  /// The fraction of the viewport that each item occupies.
  final double viewPortFraction;

  /// The padding applied to each image.
  final EdgeInsets padding;

  /// The parallax factor that controls the intensity of the parallax effect.
  final double parallaxFactor;

  /// A flag that determines whether the foreground widget should fade in and out.
  final bool foregroundFadeEnabled;

  /// A flag that determines whether the background image should zoom in and out.
  final bool backgroundZoomEnabled;

  @override
  State<ParallaxSwiper> createState() => _ParallaxSwiperState();
}

/// The state class for the `ParallaxSwiper` widget, responsible for managing its behavior.
class _ParallaxSwiperState extends State<ParallaxSwiper> {
  /// The controller for the [PageView].
  late final PageController controller;

  /// The raw index of the current page in the [PageView].
  double pageIndex = 0.0;

  /// Listener method for updating the current page index when the page changes.
  ///
  /// This method is invoked when the page changes in the [PageView] controller.
  /// It updates the [pageIndex] state variable to reflect the current page index.
  void _indexChangeListener() {
    // Update the [pageIndex] when the page changes.
    setState(() => pageIndex = controller.page!);
  }

  /// Initializes the state of the widget.
  ///
  /// This method is called when this widget is inserted into the tree and can be
  /// used for one-time initialization tasks. It creates a [PageController] with the
  /// specified `viewportFraction` and adds a listener [_indexChangeListener] to it.
  /// The listener will be called whenever the page changes. This method ensures that
  /// the controller's listener is added only after the widget is built by using
  /// `WidgetsBinding.instance.addPostFrameCallback`.
  @override
  void initState() {
    super.initState();
    controller = PageController(
      viewportFraction: widget.viewPortFraction,
    );

    // Add the index change listener to the controller after the frame is built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(_indexChangeListener);
    });
  }

  /// Dispose method to release resources when the widget is removed from the tree.
  ///
  /// This method removes the listener [_indexChangeListener] from the [controller]
  /// and disposes of the [controller] itself to prevent memory leaks and resource
  /// leaks. It should be called when the widget is no longer needed.
  @override
  void dispose() {
    // Remove the index change listener and dispose of the controller.
    controller
      ..removeListener(_indexChangeListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      // Apply drag-to-scroll behavior if enabled, otherwise use the default scroll behavior.
      behavior:
          widget.dragToScroll ? DragScrollBehavior() : const ScrollBehavior(),
      child: PageView.builder(
        controller: controller,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          // Calculate the parallax effect value based on the controller position.
          double value =
              controller.position.haveDimensions ? pageIndex - index : 0;

          return _SwiperItem(
            image: widget.images[index],
            value: value,
            padding: widget.padding,
            parallaxFactor: widget.parallaxFactor,
            foregroundFadeEnabled: widget.foregroundFadeEnabled,
            backgroundZoomEnabled: widget.backgroundZoomEnabled,
            // Replace it with your own widget if you want to display something other than text.
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// A widget representing an individual item within the parallax swiper.
class _SwiperItem extends StatelessWidget {
  /// Creates a `_SwiperItem` widget to display an individual item in the parallax swiper.
  ///
  /// Parameters:
  ///
  /// - [image] The URL of the image to display within the item.
  /// - [parallaxFactor] The parallax factor that controls the intensity of the parallax effect.
  /// - [value] The value that determines the position of the item within the swiper.
  /// - [padding] The padding applied to the item.
  /// - [child] The foreground widget to display within the item.
  /// - [foregroundFadeEnabled] A flag that determines whether the foreground widget should fade in and out.
  /// - [backgroundZoomEnabled] A flag that determines whether the background image should zoom in and out.
  const _SwiperItem({
    required this.image,
    required this.parallaxFactor,
    required this.value,
    required this.padding,
    this.child,
    this.foregroundFadeEnabled = true,
    this.backgroundZoomEnabled = true,
  });

  /// The URL of the image to display within the item.
  final String image;

  /// The parallax factor that controls the intensity of the parallax effect.
  final double parallaxFactor;

  /// The value that determines the position of the item within the swiper.
  final double value;

  /// The padding applied to the item.
  final EdgeInsets padding;

  /// The foreground widget to display within the item.
  final Widget? child;

  /// A flag that determines whether the foreground widget should fade in and out.
  final bool foregroundFadeEnabled;

  /// A flag that determines whether the background image should zoom in and out.
  final bool backgroundZoomEnabled;

  @override
  Widget build(BuildContext context) {
    // Calculate the width of the item based on the device's screen width,
    // clamped between 200.0 and 500.0.
    final width = MediaQuery.sizeOf(context).width.clamp(200.0, 500.0);

    // Create a linear interpolation between 0.0 and 1.0 based on the value of the `value` variable.
    final tween = Tween<double>(begin: 0.0, end: 1.0).transform(value);

    // Calculate the translation offset of the foreground widget.
    final foregroundOffset = Offset(-(tween * pow(parallaxFactor, 2.2)), 0);

    // Calculate the opacity of the foreground widget to create a fade effect if enabled.
    final foregroundOpacity =
        foregroundFadeEnabled ? 1 - tween.clamp(0.0, 1.0) : 1.0;

    // Calculate the translation offset of the backround widget.
    final backgroundOffset = Offset(tween * pow(parallaxFactor, 2), 0);

    // Calculate the scale factor of the background widget to create a zoom effect if enabled.
    final scale =
        backgroundZoomEnabled ? 1.0 + (value.abs() * 0.15) * 1.1 : 1.0;

    return Container(
      padding: padding,
      width: width,
      child: ClipRRect(
        // Apply rounded corners to the container.
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Transform.translate(
              // Apply a horizontal translation (parallax effect) to the image.
              offset: backgroundOffset,
              child: Transform.scale(
                // Apply a scale transformation to the image  to prevent clipping when translated.
                scale: 1.2 * scale,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Image.asset(
                    image,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            // Foreground widget
            if (child != null)
              AnimatedOpacity(
                opacity: foregroundOpacity,
                duration: const Duration(milliseconds: 100),
                child: Transform.translate(
                  offset: foregroundOffset,
                  child: child,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
