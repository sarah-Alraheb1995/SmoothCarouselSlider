

Create smooth slider with custom center selection widget 

## Features


![alt text](https://raw.githubusercontent.com/sarah-Alraheb1995/SmoothCarouselSlider/master/screenshot/smooth-carousel.gif?raw=true)

## Installation
Add smooth_carousel_slider_widget: ^1.0.0 to your pubspec.yaml dependencies. And import it:
```dart
import 'package:smooth_carousel_slider_widget/smooth_carousel_slider_widget.dart';

```

## Usage

Simply create a SmoothCarouselSlider widget, and pass the required params:

```dart
SmoothCarouselSlider(
        itemCount: 11,
        initialSelectedIndex: 5,
        itemExtent: 80,
        selectedWidget: (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 40,
            color: Colors.pinkAccent,
          ),
        ),
        unSelectedWidget: (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
            height: 40,
            color: Colors.purpleAccent,
          ),
        ),
        onSelectedItemChanged: (index) => debugPrint('$index'),
      )

```

