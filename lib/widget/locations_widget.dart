import 'package:flutter/material.dart';

import '../data/locations.dart';
import 'location_widget.dart';

class LocationsWidget extends StatefulWidget {
  const LocationsWidget({Key? key}) : super(key: key);

  @override
  LocationsWidgetState createState() => LocationsWidgetState();
}

class LocationsWidgetState extends State<LocationsWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: PageView.builder(
          controller: pageController,
          itemCount: locations.length > 5 ? 5 : locations.length, // Limit to five items
          itemBuilder: (context, index) {
            final location = locations[index];
            return LocationWidget(location: location);
          },
          onPageChanged: (index) => setState(() => pageIndex = index),
        ),
      ),
      const SizedBox(height: 12)
    ],
  );
}

