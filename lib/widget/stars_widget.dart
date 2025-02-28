import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final int stars;

  const StarsWidget({required this.stars, super.key});

  @override
  Widget build(BuildContext context) {
    final allStars = List.generate(stars, (index) => index);

    return Row(
      children: allStars
          .map(
            (star) => Container(
              margin: const EdgeInsets.only(right: 4),
              child: const Icon(
                Icons.star_rate,
                size: 18,
                color: Color.fromARGB(255, 204, 183, 0),
              ),
            ),
          )
          .toList(),
    );
  }
}
