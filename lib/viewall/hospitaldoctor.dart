import 'package:flutter/material.dart';
import 'package:sahf/doctor/docor.dart';
import 'package:sahf/doctor/doctor_card.dart';
import 'package:sahf/doctor/doctordetalspage.dart';

class AllDoctorsList1 extends StatelessWidget {
  final String hospitalName;

  const AllDoctorsList1({required this.hospitalName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter doctors based on the specified hospital name
    final filteredDoctors = doctors.where((doctor) => doctor.hospitalName == hospitalName).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B68FF),
        title: Text(
          'Médecins Recommandés',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsPage(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(doctor.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Color(0xFF4B68FF),
                              width: 1,
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              doctor.specialization,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              doctor.bio,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
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
