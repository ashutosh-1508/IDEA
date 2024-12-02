import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'IDE',
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
              Text(
                'Academy',
                style: TextStyle(fontSize: 40, color: Colors.orange),
              ),
              SizedBox(height: 20),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Access your learning platform',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),

              
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
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
                onPressed: _handleSignIn,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black, fontSize: 16), 
                ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue, width: 2),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Forgot Password Link
              TextButton(
                onPressed: _forgotPassword,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Create Account Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New here? '),
                  TextButton(
                    onPressed: _createAccount,
                    child: Text('Create Account', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }

  void _handleSignIn() {
    String username = _usernameController.text;
    String password = _passwordController.text;

  
    String correctPassword = 'admin';

    if (username == 'admin_admin' && password == correctPassword) {
      // Admin login successful
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    } else if (username == 'admin' && password == correctPassword) {
      // Regular user login successful
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage()));
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  void _forgotPassword() {
   
    print('Forgot Password clicked');
  }

  void _createAccount() {
    
    print('Create Account clicked');
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Welcome to the Admin Dashboard!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Welcome to your User Dashboard!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
