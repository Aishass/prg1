import 'package:flutter/material.dart';

import '../data/hero_tag.dart';

import '../model/location.dart';
import 'hero_widget.dart';
import 'stars_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Location location;

  const ExpandedContentWidget(
      {required this.location, super.key, required doctor});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HeroWidget(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1),
            ),
            const SizedBox(height: 8),
            buildAddressRating(location: location),
            const SizedBox(height: 12),
          ],
        ),
      );

  Widget buildAddressRating({required Location location}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine2(location),
            child: Text(
              location.addressLine2,
              style: const TextStyle(color: Colors.black45),
            ),
          ),
          HeroWidget(
            tag: HeroTag.stars(location),
            child: StarsWidget(stars: location.starRating),
          ),
        ],
      );
}
