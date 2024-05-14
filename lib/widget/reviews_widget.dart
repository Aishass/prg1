import 'package:flutter/material.dart';
import '../model/location.dart';

class ReviewsWidget extends StatelessWidget {
  final Animation<double> animation;

  const ReviewsWidget({
    required this.animation,
    super.key,
    required Location location,
  });

  get location => null;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: 5,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) => FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
              ),
              child: child,
            ),
            child: buildReview(location),
          );
        },
      );

  Widget buildReview(review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  review.username,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(),
                Text(
                  review.date,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const Icon(Icons.thumb_up_alt_outlined, size: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review.description,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
}
