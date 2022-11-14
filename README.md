<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Create smooth slider with custom center selection widget 

## Features

https://raw.githubusercontent.com/sarah-Alraheb1995/SmoothCarouselSlider/master/screenshot/smooth-carousel.gif

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

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

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
