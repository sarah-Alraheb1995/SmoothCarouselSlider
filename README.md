

Create smooth slider with custom center selection widget 

## Features


![alt text](https://raw.githubusercontent.com/sarah-Alraheb1995/SmoothCarouselSlider/master/screenshot/smooth-carousel.gif?raw=true)


![alt text](https://raw.githubusercontent.com/sarah-Alraheb1995/SmoothCarouselSlider/master/screenshot/video.mp4?raw=true)

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

