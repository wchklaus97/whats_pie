import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:resizable_widget/resizable_widget.dart';

class PreviewInfo {
  final double width;
  final Widget child;
  final List<double> widthPercentages;

  PreviewInfo._({
    required this.width,
    required this.child,
    required this.widthPercentages,
  });

  static List<double> calWidthPercentages(double width) {
    if (width >= 1300) {
      return [0.15, 0.85];
    } else if (width >= 1000 && width < 1300) {
      return [0.20, 0.80];
    } else if (width >= 550 && width < 1000) {
      return [0.30, 0.70];
    }
    return [0.35, 0.65];
  }

  bool haveSameRatio(double width) {
    return listEquals(widthPercentages, calWidthPercentages(width));
  }

  factory PreviewInfo.init({required double width}) {
    final newWidthPercentages = calWidthPercentages(width);
    return PreviewInfo._(
      width: width,
      widthPercentages: newWidthPercentages,
      child: ResizableWidget(
          key: UniqueKey(),
          percentages: newWidthPercentages,
          children: [
            Container(color: Colors.amber),
            Container(color: Colors.blue)
          ]),
    );
  }
}
