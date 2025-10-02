import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_picker/number_picker_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberPickerPage(),
    );
  }
}

class NumberPickerPage extends StatefulWidget {
  const NumberPickerPage({super.key});

  @override
  State<NumberPickerPage> createState() => _NumberPickerPageState();
}

class _NumberPickerPageState extends State<NumberPickerPage> {
  int _selectedValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NumberPickerWidget(
          triangleColor: Colors.green,
          boxBackgroundColor: Colors.yellow.shade100,
          numberColor: Colors.grey,
          selectedNumberColor: Colors.red,
          minValue: 10,
          maxValue: 50,
          step: 2,
          itemCount: 7,
          value: _selectedValue,
          onValueChanged: (val) {
            setState(() => _selectedValue = val);
          },
        ),
      ),
    );
  }
}
