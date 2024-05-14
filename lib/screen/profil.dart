import 'package:flutter/material.dart';



class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF4B68FF), // Set app bar background color
        centerTitle: true, // Center the title horizontally
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Profile information section
          Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B68FF), // Set text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text('John Doe'),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('john.doe@example.com'),
                  ),
                  // Add more profile information here
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Account settings section
          Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B68FF), // Set text color
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Change Password'),
                    onTap: () {
                      // Navigate to change password page
                    },
                  ),
                  ListTile(
                    title: Text('Privacy Settings'),
                    onTap: () {
                      // Navigate to privacy settings page
                    },
                  ),
                  // Add more account settings options here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
