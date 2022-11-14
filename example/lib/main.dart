import 'package:flutter/material.dart';
import 'package:smooth_carousel_slider_widget/smooth_carousel_slider_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);
  final List<String> weekDays = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SmoothCarouselSlider(
          unSelectedWidget: (index) {
            return DayCard(
              dayName: weekDays[index],
              isCenter: false,
              index: index,
            );
          },
          selectedWidget: (index) {
            return DayCard(
              dayName: weekDays[index],
              isCenter: true,
              index: index,
            );
          },
          initialSelectedIndex: weekDays.length ~/ 2,
          itemCount: weekDays.length,
          itemExtent: 75,
          onSelectedItemChanged: (index) {
            debugPrint(weekDays[index]);
          },
       
        ),
      ),
    );
  }
}
//!=====================================================================
class DayCard extends StatelessWidget {
  final int index;
  final String dayName;
  final bool isCenter;

  const DayCard(
      {Key? key,
      required this.index,
      required this.dayName,
      required this.isCenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: isCenter
                    ? const LinearGradient(
                        colors: [Color(0xFFB6116B), Color(0xFF2E1371)])
                    : const LinearGradient(colors: [
                        Color(0xFF2E1371),
                        Color(0xFF2E1371),
                        Color(0xFF130B2B)
                      ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
