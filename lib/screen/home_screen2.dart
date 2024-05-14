import 'package:flutter/material.dart';

import 'package:sahf/doctor/polpulardoc.dart';
import 'package:sahf/screen/CurvedContainer.dart';
import 'package:sahf/viewall/doctorlist.dart';
import 'package:sahf/viewall/hospitallist.dart';
import 'package:sahf/widget/locations_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 310,
            child: CurvedContainer(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Medecin recommande",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all doctors screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllDoctorsList(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade800),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF4B68FF)),
                          ),
                          child: const Text("View All"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                    child: PopularDoctorsWidget(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hopital recommande",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to all hospitals screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllHospitalsListe(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade800),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF4B68FF)),
                          ),
                          child: const Text("View All"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 450,
                    child: LocationsWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
