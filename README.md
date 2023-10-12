# Flutter Parallax Swiper UI Challenge

## Overview

The Flutter Parallax Swiper UI Challenge showcases a dynamic parallax swiper widget, designed to elevate your user interface experiences. This widget allows you to create a horizontal swiper that displays a list of images with captivating parallax scrolling effects. Customize its behavior by providing image URLs, enabling drag-to-scroll, setting viewport fractions, adjusting padding, controlling the parallax factor, and toggling foreground fading and background zoom.


https://github.com/monster555/flutter_parallax_swiper/assets/32662133/0f913f3b-94db-487d-9ff5-2af684febb95


### Example 1: 
Using `ParallaxSwiper` with Default Values (Foreground Fading and Background Zoom Enabled):

```dart
ParallaxSwiper(
  images: [
    'image_url_1.jpg',
    'image_url_2.jpg',
    'image_url_3.jpg',
  ],
)
```
### Example 2: 
Using `ParallaxSwiper` with No Foreground Fading and No Background Zoom:

```dart
ParallaxSwiper(
  images: [
    'image_url_1.jpg',
    'image_url_2.jpg',
    'image_url_3.jpg',
  ],
  dragToScroll: true,
  viewPortFraction: 0.85,
  padding: EdgeInsets.all(16.0),
  parallaxFactor: 10.0,
  foregroundFadeEnabled: false, // Disable foreground image fading.
  backgroundZoomEnabled: false, // Disable background image zooming.
)
```
## Usage
```dart
ParallaxSwiper(
  images: [
    'image_url_1.jpg',
    'image_url_2.jpg',
    'image_url_3.jpg',
  ],
  dragToScroll: true,
  viewPortFraction: 0.85,
  padding: EdgeInsets.all(16.0),
  parallaxFactor: 10.0,
  foregroundFadeEnabled: true,
  backgroundZoomEnabled: true,
)
```
## Configuration Parameters
- `images (List<String>)`: The list of image URLs to display.
- `dragToScroll (bool)`: Enable or disable drag-to-scroll functionality.
- `viewPortFraction (double)`: Set the viewport fraction for image display.
- `padding (EdgeInsets)`: Define padding for the swiper.
- `parallaxFactor (double)`: Adjust the parallax factor to control scrolling effects.
- `foregroundFadeEnabled (bool)`: Toggle foreground image fading.
- `backgroundZoomEnabled (bool)`: Toggle background image zoom.

## Contribution
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to create a pull request.

## License
The Flutter Parallax Swiper UI Challenge is released under the MIT License. See LICENSE for details.
