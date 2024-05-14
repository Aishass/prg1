import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.margin = EdgeInsets.zero, // Provide default margin
    this.padding = EdgeInsets.zero, // Provide default padding
    this.showBorder = false,
    this.radius = 16.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey, required int borderRadius,
   
  });

  final double? width;
  final double? height;
  final Widget? child;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final bool showBorder;
  final double radius;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
