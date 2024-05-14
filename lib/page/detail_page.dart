import 'package:flutter/material.dart';
import 'package:sahf/categries/category.dart';
import 'package:sahf/container/searchbar.dart' as CustomSearchBar;
import 'package:sahf/doctor/docor.dart';
import 'package:sahf/doctor/doctor_card.dart';

import 'package:sahf/doctor/populardoctorhosp.dart';

import 'package:sahf/viewall/hospitaldoctor.dart';
import '../data/hero_tag.dart';
import '../model/location.dart';
import '../widget/detailed_info_widget.dart';
import '../widget/hero_widget.dart';


// Assuming you have a function to filter doctors based on hospital name
List<Doctor> filterDoctorsByHospital(List<Doctor> doctors, String hospitalName) {
  return doctors.where((doctor) => doctor?.hospitalName == hospitalName).toList();
}

// Now you can use the filteredDoctors list in your DetailPage widget
class DetailPage extends StatelessWidget {
  final Location location;
  final Animation<double> animation;

  const DetailPage({
    required this.location,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter doctors based on the hospital name of the location
    final filteredDoctors = filterDoctorsByHospital(doctors, location.name);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(location.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox.expand(
                  child: HeroWidget(
                    tag: HeroTag.image(location.imageUrl),
                    child: Image.asset(location.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomSearchBar.SearchBar(text: 'Search service...'),
                      SizedBox(height: 1),
                      CategoryList(), 
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: DetailedInfoWidget(location: location),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
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
    // Navigate to all doctors screen and pass the hospital name
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllDoctorsList1(hospitalName: location.name),
      ),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
    foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF4B68FF)),
  ),
  child: const Text("View All"),
),

                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300,
                      child: PopularDoctorshospital(doctors: filteredDoctors),
                    ),
                     SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "all ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        

                      ],
                    ),
                     SizedBox(height: 20),
                     
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
