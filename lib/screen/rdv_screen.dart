import 'package:flutter/material.dart';

class RendezVousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back arrow icon
          centerTitle: true, // Center the title text
          title: Text(
            'Rendez Vous',
            
            style: TextStyle(
             color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF4B68FF),
          shape: CustomShapeBorder(), // Apply custom curved background shape
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100, // Background color of the rounded container
              ),
              child: TabBar(
                labelColor: Color(0xFF4B68FF),
                tabs: [
                  Tab(text: 'À Venir'),
                  Tab(text: 'Complétés'),
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade800, // Color of the selected tab
                ),
                indicatorSize:
                    TabBarIndicatorSize.tab, // Fixed size based on tab width
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    children: [
                      UpcomingAppointmentsPage(),
                      CompletedAppointmentsPage(),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic to navigate to the appointment scheduling page
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF4B68FF), // Button color
                      ),
                      child: Text(
                        'Prendre un rendez-vous',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom ClipPath widget to create a curved background shape
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double curverdRadius = 40.0; // Adjust the curve radius as needed
    final Path path = Path()
      ..lineTo(0, rect.height - curverdRadius)
      ..quadraticBezierTo(0, rect.height, curverdRadius, rect.height)
      ..lineTo(rect.width - curverdRadius, rect.height)
      ..quadraticBezierTo(
          rect.width, rect.height, rect.width, rect.height - curverdRadius)
      ..lineTo(rect.width, 0)
      ..close();
    return path;
  }
}



class CompletedAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history,
                size: 100,
                color: Color(0xFF4B68FF),
              ),
              SizedBox(height: 20),
              Text(
                'L\'historique des rendez-vous est désactivé',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              // Logic to navigate to the appointment scheduling page
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF4B68FF), // Text color
            ),
            child: Text(
              'Prendre un rendez-vous',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class UpcomingAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                size: 100,
                color: Color(0xFF4B68FF),
              ),
              SizedBox(height: 20),
              Text(
                'Aucun rendez-vous à venir',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              // Logic to navigate to the appointment scheduling page
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF4B68FF), // Text color
            ),
            child: Text(
              'Prendre un rendez-vous',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
