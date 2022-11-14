import 'package:flutter/material.dart';

class SmoothCarouselSlider extends StatefulWidget {
  const SmoothCarouselSlider(
      {Key? key,
      required this.initialSelectedIndex,
      required this.itemCount,
      required this.itemExtent,
      required this.onSelectedItemChanged,
      required this.unSelectedWidget,
      required this.selectedWidget,
      this.backgroundColor,
      this.scale=1.2,
      this.yOffset=30})
      : super(key: key);

  ///Number of Items in list
  final int itemCount;

  /// Size of each child in the main axis. Must not be null and must be
  /// positive.
  final double itemExtent;

  ///The index of initial selected Item
  final int initialSelectedIndex;

  /// On optional listener that's called when the selected item changes.
  final void Function(int)? onSelectedItemChanged;

  /// unselected widget
  final Widget Function(int index) unSelectedWidget;

  ///Selected widget
  final Widget Function(int index) selectedWidget;
  ///background color
  final Color? backgroundColor;
  ///scale applied to selected item
  final double  scale;
  /// the Y offset of unSelected widget
  final double yOffset;

  @override
  State<SmoothCarouselSlider> createState() => _SmoothCarouselSliderState();
}

class _SmoothCarouselSliderState extends State<SmoothCarouselSlider> {
  
  final _scrollController = FixedExtentScrollController();

 late int _selectedindex ;

  void _scrollToIndex(int index) {
    _scrollController.jumpTo((widget.itemExtent * index.toDouble()));
  }
  void _setSelectedIndex(int index)
  {
  setState(() {
    _selectedindex=index;
  });
  }

  @override
  void initState() {
    super.initState();
     _setSelectedIndex(widget.initialSelectedIndex);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToIndex(widget.initialSelectedIndex);
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: widget.backgroundColor,
        child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            physics: const FixedExtentScrollPhysics(),
            controller: _scrollController,
            itemExtent: widget.itemExtent,
            diameterRatio: 100,

            onSelectedItemChanged: (value) {
            _setSelectedIndex(value);
              if (widget.onSelectedItemChanged != null) {
                widget.onSelectedItemChanged!(value);
              }
            },
            children: [
              for (int index = 0; index < widget.itemCount; index++)
                RotatedBox(
                  quarterTurns: 1,
                  child: Transform.scale(
                    scale: _selectedindex == index ? widget.scale : 1,
                    child: Transform.translate(
                        offset: Offset(
                          0,
                          _selectedindex == index
                              ? 0
                              : widget.yOffset * (index - _selectedindex).abs().toDouble(),
                        ),
                        child: index == _selectedindex
                            ? widget.selectedWidget(index)
                            : widget.unSelectedWidget(index)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
