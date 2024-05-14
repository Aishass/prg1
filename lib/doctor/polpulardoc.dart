import 'package:flutter/material.dart';
import 'package:sahf/doctor/docWidget.dart';
import 'package:sahf/doctor/docor.dart';

class PopularDoctorsWidget extends StatefulWidget {
  const PopularDoctorsWidget({Key? key});

  @override
  _PopularDoctorsWidgetState createState() => _PopularDoctorsWidgetState();
}

class _PopularDoctorsWidgetState extends State<PopularDoctorsWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: doctors.length > 5 ? 5 : doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorWidget(doctor: doctor,);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          const SizedBox(height: 12),
        ],
      );
}

