import 'package:flutter/material.dart';
import 'package:sahf/doctor/doctor_card.dart';

class ExpandedContentWidget1 extends StatelessWidget {
  final Doctor doctor;

  const ExpandedContentWidget1({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctor.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set the color to black
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Specialization: ${doctor.specialization}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Set the color to black
            ),
          ),
          SizedBox(height: 8),
          Text(
            doctor.bio,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Set the color to black
            ),
          ),
          // Add more information about the doctor as needed
        ],
      ),
    );
  }
}