import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';  // Import SharedPreferences for session management

// Import the main.dart file or the file where your SignInScreen is defined
import 'main.dart'; // Ensure the path matches the actual location of your main.dart file

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Header Section (Your frontend remains unchanged)
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sanket Kulkarni",  // Change the name as per your profile
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "sanket@gmail.com",  // Change email as per the profile
                style: TextStyle(color: Colors.grey),
              ),
              Text("India", style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 20),

          // Settings and Options (Your frontend remains unchanged)
          SwitchListTile(
            title: Text("Push Notifications"),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text("Play audio in background"),
            subtitle: Text("Only for course videos"),
            value: true,
            onChanged: (value) {},
          ),
          ListTile(
            title: Text("Manage Downloads"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Refer and Earn"),
            subtitle: Text(
              "Receive benefits up to ₹10,000 for every friend who enrolls",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Connected Accounts"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Rate App"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Share Simplilearn app"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Support"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          // Sign Out Section (Update sign-out logic)
          ListTile(
            title: Text("Sign Out"),
            trailing: Icon(Icons.logout),
            onTap: () async {
              // Clear user session (if applicable)
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();  // Clears all saved data (e.g., login credentials)

              // Navigate back to the SignInScreen and remove all previous routes from the stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),  // Corrected to SignInScreen
                    (route) => false,  // This will remove all previous routes, effectively restarting the app
              );
            },
          ),

          SizedBox(height: 20),

          // Footer Section (Your frontend remains unchanged)
          Center(
            child: Text(
              "Version 11.8.17",  // Example version text, change as needed
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
