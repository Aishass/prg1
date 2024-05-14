import 'package:flutter/material.dart';

import '../model/location.dart';
import '../page/detail_page.dart';
import 'expanded_content_widget.dart';
import 'image_widget.dart'; // Import the ImageWidget

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget({required this.location, super.key});

  @override
  LocationWidgetState createState() => LocationWidgetState();
}

class LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 70 : 100,
          width: isExpanded ? size.width * 0.8 : size.width * 0.7,
          height: isExpanded ? size.height * 0.5 : size.height * 0.2,
          child: ExpandedContentWidget(location: widget.location, doctor: null, ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: isExpanded ? 150 : 90,
          child: GestureDetector(
            onPanUpdate: onPanUpdate,
            onTap: openDetailPage,
            child: ImageWidget(location: widget.location, imageUrl: '',), // Use ImageWidget
          ),
        ),
      ],
    );
  }

  void openDetailPage() {
    try {
      if (!isExpanded) {
        setState(() => isExpanded = true);
        return;
      }

      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0, 0.5),
            );

            return FadeTransition(
              opacity: curvedAnimation,
              child: DetailPage(location: widget.location, animation: animation),
            );
          },
        ),
      );
    } catch (e, stackTrace) {
      print('Exception occurred: $e');
      print('Stack trace: $stackTrace');
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}

