import 'package:flutter/material.dart';
import 'package:sahf/categries/Doctorslistpage.dart';
import 'package:sahf/categries/categorylist.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        children: [
          SectionHeading(
            title: 'Categories',
            
            showActionButton: false,
            onPressed: () {},
            buttonTitle: 'view all',
          ),
          SizedBox(height: 2.0),
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                List<IconData> icons = [
                  Icons.home,
                  Icons.work,
                  Icons.shopping_cart,
                  Icons.restaurant,
                  Icons.fitness_center,
                  Icons.travel_explore,
                ];
                List<String> specializations = [
                  'Cardiologist',
                  'Orthopedic',
                  'Pharmacist',
                  'Gastroenterologist',
                  'Physiotherapist',
                  'Travel Medicine Doctor',
                ];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CategoryItem(
                    icon: icons[index],
                    text: specializations[index],
                    specialization: specializations[index], // Pass the correct specialization
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsListPage(
                            specialization: specializations[index], // Pass the specialization
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String specialization; // Add specialization parameter
  final VoidCallback onTap; // Add onTap parameter

  const CategoryItem({
    required this.icon,
    required this.text,
    required this.specialization, // Initialize specialization
    required this.onTap, // Initialize onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap with GestureDetector to handle onTap
      onTap: onTap, // Call onTap function when tapped
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final bool showActionButton;

  const SectionHeading({
    required this.title,
    this.showActionButton = true,
    required Null Function() onPressed,
    required String buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Category",
          style: TextStyle(
            color: Colors.white,
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
                builder: (context) => categoryallList(),
              ),
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Text("View All"),
        ),
      ],
    );
  }
}
