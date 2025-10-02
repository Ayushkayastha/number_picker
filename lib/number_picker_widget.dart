import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_triangle.dart';
import 'number_picker.dart';

class NumberPickerWidget extends StatefulWidget {
  final Color triangleColor;
  final Color boxBackgroundColor;
  final Color numberColor;
  final Color selectedNumberColor;

  final int minValue;
  final int maxValue;
  final int value;
  final ValueChanged<int>? onValueChanged;

  final int itemCount;
  final int step;
  final double itemHeight;
  final double itemWidth;
  final Axis axis;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final bool haptics;
  final TextMapper? textMapper;
  final bool zeroPad;
  final Decoration? decoration;
  final bool infiniteLoop;

  const NumberPickerWidget({
    super.key,
    this.triangleColor = const Color(0xffFB8C00),
    this.boxBackgroundColor = const Color(0xFFF3DFD2),
    this.numberColor = const Color(0xFFDCC1AE),
    this.selectedNumberColor = Colors.black,

    this.minValue = 0,
    this.maxValue = 99,
    this.value = 0,
    this.onValueChanged,

    this.itemCount = 5,
    this.step = 1,
    this.itemHeight = 76,
    this.itemWidth = 124,
    this.axis = Axis.vertical,
    this.textStyle,
    this.selectedTextStyle,
    this.haptics = true,
    this.textMapper,
    this.zeroPad = true,
    this.decoration,
    this.infiniteLoop = true,
  });

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}
class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: pi,
            child: CustomPaint(
              size: const Size(40, 44),
              painter: RPSCustomTriangle(color: widget.triangleColor),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.boxBackgroundColor,
            ),
            child: NumberPicker(
              minValue: widget.minValue,
              maxValue: widget.maxValue,
              value: _currentValue,
              onChanged: (newValue) {
                setState(() => _currentValue = newValue);
                widget.onValueChanged?.call(newValue);
              },
              itemCount: widget.itemCount,
              step: widget.step,
              itemHeight: widget.itemHeight,
              itemWidth: widget.itemWidth,
              axis: widget.axis,
              haptics: widget.haptics,
              textMapper: widget.textMapper,
              zeroPad: widget.zeroPad,
              infiniteLoop: widget.infiniteLoop,
              textStyle: widget.textStyle ??
                  TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: widget.numberColor,
                  ),
              selectedTextStyle: widget.selectedTextStyle ??
                  TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: widget.selectedNumberColor,
                  ),
              decoration: widget.decoration ??
                  BoxDecoration(
                    border: Border.all(
                      color: widget.triangleColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
            ),
          ),
          const SizedBox(width: 16),
          CustomPaint(
            size: const Size(40, 44),
            painter: RPSCustomTriangle(color: widget.triangleColor),
          ),
        ],
      );
  }
}

