import 'package:flutter/material.dart';
import 'package:sahf/doctor/doctor_card.dart';
import 'package:sahf/doctor/doctordetalspage.dart';

class DoctorWidget extends StatelessWidget {
  final Doctor doctor;

  const DoctorWidget({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsPage(doctor: doctor),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0,right: 16.0), // Add bottom padding
        child: SizedBox(
          width: 200, // Set a default width, you can change this as needed
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey.shade800, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    doctor.imageUrl,
                    width: double.infinity, // Ensure the image takes full width
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    doctor.specialization,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    doctor.bio,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

