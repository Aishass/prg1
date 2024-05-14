import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:sahf/screen/dossier.dart';
import 'package:sahf/screen/home_screen2.dart';
import 'package:sahf/screen/profil.dart';
import 'package:sahf/screen/rdv_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
// PageView for managing content
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              HomePage(),
              RendezVousPage(),
              DossierPage(),
              ProfilPage(),
            ],
          ),
        ],
      ),
// Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            backgroundColor: Colors.white,
            activeColor: Color(0xFF4B68FF),
            tabBackgroundColor: Colors.grey.shade800,
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(index);
              });
            },
            padding: EdgeInsets.all(12),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Accueil',
                iconColor: Color(0xFF4B68FF),
              ),
              GButton(
                icon: Icons.event,
                text: 'Rendez-vous',
                iconColor: Color(0xFF4B68FF),
              ),
              GButton(
                icon: Icons.edit_document,
                text: 'Dossier',
                iconColor: Color(0xFF4B68FF),
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profil',
                iconColor: Color(0xFF4B68FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
