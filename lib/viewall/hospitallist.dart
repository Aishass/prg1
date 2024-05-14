import 'package:flutter/material.dart';
import 'package:sahf/data/locations.dart';
import 'package:sahf/doctor/roundcontainer.dart';
import 'package:sahf/doctor/roundedImage.dart';
import 'package:sahf/page/detail_page.dart';

class AllHospitalsListe extends StatelessWidget {
  get animation => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B68FF),
        title: Text(
          'Hôpitaux',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    // Wrap with Material widget for InkWell ripple effect
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Navigate to detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(location: location, animation: animation,),
                          ),
                        );
                      },
                      child: RoundContainer(
                        height: 120, // Adjust height
                        width: 550, // Adjust width
                        borderRadius: 20, // Adjust border radius
                        backgroundColor: Colors.white,
                        showBorder: true,
                        child: Row(
                          children: [
                            // Display the image
                            RoundedImage(
                              imageUrl: location.imageUrl,
                              borderRadius: 20,
                              height: 120, // Ensure the height matches the container
                              width: 100, // Ensure the width matches the container
                            ),
                            SizedBox(width: 8), // Add space between image and text
                            // Display the hospital information
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    location.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    location.addressLine1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    location.addressLine2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

