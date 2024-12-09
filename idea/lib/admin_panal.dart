import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences for session management
import 'package:idea/main.dart'; // Import the main.dart file or the file where your SignInPage is defined

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Header Section
          const Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.admin_panel_settings,
                    size: 40, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "Admin Name", // Change to the actual admin name
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "admin@example.com", // Admin email
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Admin Options (Admin panel options such as managing users, settings, etc.)
          ListTile(
            title: const Text("Manage Users"),
            trailing: const Icon(Icons.people),
            onTap: () {
              // Navigate to the Manage Users screen (Implement this screen as needed)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManageUsersPage()));
            },
          ),
          ListTile(
            title: const Text("View Statistics"),
            trailing: const Icon(Icons.analytics),
            onTap: () {
              // Navigate to the Statistics screen (Implement this screen as needed)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewStatisticsPage()));
            },
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            onTap: () {
              // Navigate to the Settings screen (Implement this screen as needed)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            title: Text("Reports"),
            trailing: Icon(Icons.report),
            onTap: () {
              // Navigate to the Reports screen (Implement this screen as needed)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportsPage()));
            },
          ),
          ListTile(
            title: Text("Notifications"),
            trailing: Icon(Icons.notifications),
            onTap: () {
              // Navigate to the Notifications screen (Implement this screen as needed)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()));
            },
          ),

          SizedBox(height: 20),

          // Sign Out Section
          ListTile(
            title: Text("Sign Out"),
            trailing: Icon(Icons.logout),
            onTap: () async {
              // Clear user session (if applicable)
              final prefs = await SharedPreferences.getInstance();
              await prefs
                  .clear(); // Clears all saved data (e.g., login credentials)

              // Navigate back to the SignInPage and remove all previous routes from the stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignInScreen()), // Use SignInScreen here
                (route) =>
                    false, // This will remove all previous routes, effectively restarting the app
              );
            },
          ),

          SizedBox(height: 20),

          // Footer Section
          Center(
            child: Text(
              "Version 1.0.0", // Example version text, change as needed
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// Example of a Manage Users Page (You can implement this as per your needs)
class ManageUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Users"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Manage Users Here"), // Replace with actual content
      ),
    );
  }
}

// Example of a View Statistics Page (You can implement this as per your needs)
class ViewStatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Statistics"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("View Statistics Here"), // Replace with actual content
      ),
    );
  }
}

// Example of a Settings Page (You can implement this as per your needs)
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Settings Here"), // Replace with actual content
      ),
    );
  }
}

// Example of a Reports Page (You can implement this as per your needs)
class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Reports Here"), // Replace with actual content
      ),
    );
  }
}

// Example of a Notifications Page (You can implement this as per your needs)
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Notifications Here"), // Replace with actual content
      ),
    );
  }
}
