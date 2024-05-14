import 'package:flutter/material.dart';

import 'package:sahf/categries/category.dart';
import 'package:sahf/container/searchbar.dart' as CustomSearchBar;

import 'package:iconsax/iconsax.dart';
import 'package:sahf/screen/CustomcurvedEgdges.dart';

class CurvedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Fixed curved container (colored part)
          SizedBox(
            height: 310,
            child: ClipPath(
              clipper: TCustomcurvedEgdges(),
              child: Container(
                color: Color(0xFF4B68FF),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: PopupMenuButton<String>(
                        icon: Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        onSelected: (String language) {
                          // Implement language change logic here
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'en',
                            child: Text('English'),
                          ),
                          PopupMenuItem<String>(
                            value: 'fr',
                            child: Text('French'),
                          ),
                          PopupMenuItem<String>(
                            value: 'ar',
                            child: Text('Arabic'),
                          ),
                        ],
                      ),
                      title: Text(
                        'Application',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 35, // Adjust the font size as needed
                          color: Colors.black, // Adjust the color as needed
                        ),
                      ),
                      centerTitle: true, // Centers the title horizontally
                      actions: [
                        Stack(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Implement notification action
                              },
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(
                                          color: Colors.white,
                                          fontSizeFactor: 0.8,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomSearchBar.SearchBar(
                      text: 'Search service...',
                      icon: Iconsax.search_normal,
                    ),
                    CategoryList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
