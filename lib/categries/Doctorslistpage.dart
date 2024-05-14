import 'package:flutter/material.dart';
import 'package:sahf/doctor/docor.dart';
import 'package:sahf/doctor/doctor_card.dart';
import 'package:sahf/doctor/doctordetalspage.dart';

class DoctorsListPage extends StatelessWidget {
  final String specialization;

  const DoctorsListPage({required this.specialization});

  @override
  Widget build(BuildContext context) {
    // Filter the list of doctors based on the specialization
    List<Doctor> doctorsWithSpecialization = doctors.where((doctor) => doctor.specialization == specialization).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$specialization', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF4B68FF),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding here
        child: Scrollbar(
          child: ListView.builder(
            itemCount: doctorsWithSpecialization.length,
            itemBuilder: (context, index) {
              Doctor doctor = doctorsWithSpecialization[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to DoctorDetailsPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailsPage(doctor: doctor),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
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
        ),
      ),
    );
  }
}
