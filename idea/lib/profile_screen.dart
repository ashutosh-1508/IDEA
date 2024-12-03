import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

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
          // Header Section
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
                "Sanket kulkarni",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "sanket@gmail.com",
                style: TextStyle(color: Colors.grey),
              ),
              Text("India", style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 20),

          // Settings and Options
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
          ListTile(
            title: Text("Sign Out"),
            trailing: Icon(Icons.logout),
            onTap: () {},
          ),
          SizedBox(height: 20),

          // Footer Section
          Center(
            child: Text(
              "Version 11.8.17",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
