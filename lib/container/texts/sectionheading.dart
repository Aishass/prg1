import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    Key? key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  }) : super(key: key);

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (showActionButton && buttonTitle.isNotEmpty)
              TextButton(
                onPressed: onPressed,
                child: Text(buttonTitle),
              ),
          ],
        ),
        const SizedBox(height: 8), // Add some space between the title and the button
      ],
    );
  }
}


