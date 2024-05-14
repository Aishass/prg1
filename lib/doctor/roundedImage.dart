import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final bool applyImageRadius;
  final double height;
  final double width;

  const RoundedImage({
    Key? key,
    required this.imageUrl,
    required this.borderRadius ,
    this.applyImageRadius = true,
    this.height=100,
     this.width=100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey, // Placeholder color
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
        child: Image(
          image: AssetImage(imageUrl), // Use AssetImage for local assets
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
