// hospital_image.dart
import 'package:flutter/material.dart';
import 'package:sahf/container/rating.dart';

class HospitalImage extends StatefulWidget {
  final String name;
  final String address;
  final double rating;
  final String imageUrl;

  HospitalImage({
    required this.name,
    required this.address,
    required this.rating,
    required this.imageUrl,
  });

  @override
  _HospitalImageState createState() => _HospitalImageState();
}

class _HospitalImageState extends State<HospitalImage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? HospitalInfo(
              name: widget.name,
              address: widget.address,
              rating: widget.rating,
            )
          : Image.asset(widget.imageUrl),
    );
  }
}

class HospitalInfo extends StatelessWidget {
  final String name;
  final String address;
  final double rating;

  HospitalInfo({
    required this.name,
    required this.address,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(name),
          Text(address),
          RatingBar(rating: rating),
        ],
      ),
    );
  }
}

