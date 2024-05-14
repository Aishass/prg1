import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DossierPage extends StatelessWidget {
  const DossierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow icon
        title: Text(
          
          'Dossier Médicale',
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,color:Colors.white,), // Bold italic text
        ),
        backgroundColor: Color(0xFF4B68FF), // Set app bar background color
        shape: CustomShapeBorder(), // Apply custom curved background shape
        centerTitle: true, // Center the title horizontally
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget
            Image.asset(
              'assets/dossier_image.png', // Replace with your image asset path
              width: 200, // Adjust size as needed
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            // Text widget
            Text(
              'Consulter vos documents de santé sur l\'application nom',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            
            ),
            SizedBox(height: 20),
            // Button widget
            Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic to navigate to the appointment scheduling page
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF4B68FF), // Button color
                      ),
                      child: Text(
                        'Connectez-vous',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// Custom ClipPath widget to create a curved background shape
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double curvedRadius = 40.0; // Adjust the curve radius as needed
    final Path path = Path()
      ..lineTo(0, rect.height - curvedRadius)
      ..quadraticBezierTo(0, rect.height, curvedRadius, rect.height)
      ..lineTo(rect.width - curvedRadius, rect.height)
      ..quadraticBezierTo(
          rect.width, rect.height, rect.width, rect.height - curvedRadius)
      ..lineTo(rect.width, 0)
      ..close();
    return path;
  }
}
