import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController? controller;

  const SearchBar({
    Key? key,
    required this.text,
    this.icon = Icons.search,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration.collapsed(
                  hintText: text,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
