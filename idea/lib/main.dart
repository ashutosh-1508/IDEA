import 'package:flutter/material.dart';
import 'admin_panal.dart'; // Import your Admin Panel screen
import 'home_page.dart'; // Import your Home Page screen
import 'registration_page.dart'; // Import your RegistrationPage screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isEmailLogin = false; // Tracks if email login is selected
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        leading: Icon(Icons.business, color: Colors.blue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "IDE Academy" name section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IDE',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  Text(
                    'Academy',
                    style: TextStyle(fontSize: 40, color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 30), // Space between the title and the sign-in form

              // Sign-In Title and Subtext
              Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Access your learning platform',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),

              // If email login is selected, show email and password input fields
              if (_isEmailLogin)
                Column(
                  children: [
                    // Back Button to go to previous login options
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isEmailLogin = false; // Toggle back to other login methods
                        });
                      },
                      child: Text(
                        'Back to other login options',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _handleEmailSignIn,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    SignInButton(
                      text: 'Sign in with Google',
                      color: Colors.red,
                      icon: Icons.g_mobiledata,
                      onPressed: () {
                        // Google sign-in logic removed
                        print("Google sign-in button clicked");
                      },
                    ),
                    SizedBox(height: 10),
                    SignInButton(
                      text: 'Sign in with Facebook',
                      color: Colors.blue,
                      icon: Icons.facebook,
                      onPressed: () {
                        // Facebook sign-in logic removed
                        print("Facebook sign-in button clicked");
                      },
                    ),
                    SizedBox(height: 10),
                    SignInButton(
                      text: 'Sign in with email',
                      color: Colors.grey[700],
                      icon: Icons.email,
                      onPressed: _toggleEmailLogin,
                    ),
                  ],
                ),
              
              // New here? Create Account link
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New here? '),
                  TextButton(
                    onPressed: () {
                      // Navigate to RegistrationPage when 'Create Account' is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationPage()),
                      );
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              // Reset Password link
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to the Reset Password screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Toggle the email login form visibility
  void _toggleEmailLogin() {
    setState(() {
      _isEmailLogin = !_isEmailLogin;
    });
  }

  // Handle email/password sign-in
  void _handleEmailSignIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Admin login credentials
    String adminEmail = 'admin';
    String userEmail = 'user';
    String adminPassword = 'admin';
    String userPassword = 'user';

    // Check credentials
    if ((email == adminEmail && password == adminPassword) ||
        (email == userEmail && password == userPassword)) {
      if (email == adminEmail) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminPanel()), // Admin Panel Page
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()), // Home Page
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }
}

// Reset Password Screen
class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter your email to reset your password.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the reset password logic here (e.g., backend API)
                String email = _emailController.text;
                if (email.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid email address')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password reset link sent to $email')),
                  );
                  Navigator.pop(context); // Navigate back to the sign-in screen
                }
              },
              child: Text("Send Reset Link"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData icon;
  final VoidCallback onPressed;

  const SignInButton({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,  // Corrected from 'primary' to 'backgroundColor'
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
