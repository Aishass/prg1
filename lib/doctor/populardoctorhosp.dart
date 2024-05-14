import 'package:flutter/material.dart';
import 'package:sahf/doctor/docWidget.dart';
import 'package:sahf/doctor/doctor_card.dart';


class PopularDoctorshospital extends StatefulWidget {
  final List<Doctor> doctors;

  const PopularDoctorshospital({Key? key, required this.doctors}) : super(key: key);

  @override
  _PopularDoctorshospitalState createState() => _PopularDoctorshospitalState();
}

class _PopularDoctorshospitalState extends State<PopularDoctorshospital> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300, // Adjust the height as needed
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.doctors.length > 5 ? 5 : widget.doctors.length,
            itemBuilder: (context, index) {
              final doctor = widget.doctors[index];
              return DoctorWidget(doctor: doctor);
            },
            onPageChanged: (index) => setState(() => pageIndex = index),
          ),
        ),
       
      ],
    );
  }
}
