import 'dart:async'; // Add this import for Timer
import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import your ProfilePage here


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _banners = [
    "Advance to Master’s Level Excellence",
    "Boost Your Career with New Skills",
    "Unlock Your Potential with Our Courses"
  ];

  final List<Map<String, String>> _categories = [
    {'icon': 'bar_chart', 'title': 'Data Science & Business Analytics'},
    {'icon': 'code', 'title': 'Software Development'},
    {'icon': 'devices', 'title': 'Mobile Development'},
    {'icon': 'design_services', 'title': 'UI/UX Design'},
    {'icon': 'build', 'title': 'Machine Learning'},
    {'icon': 'cloud', 'title': 'Cloud Computing'},
    {'icon': 'business', 'title': 'Blockchain'}, // Updated to 'business'
    {'icon': 'security', 'title': 'Cyber Security'},
  ];

  @override
  void initState() {
    super.initState();
    // Automatically scroll after 1 second
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // Scroll to the next page
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // Dispose of the PageController when not needed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Navigate to the ProfileScreen when tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage()), // Updated to navigate to ProfilePage
            );
          },
          child: const Text('Hi, Sanket!'),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner (Scrolling automatically)
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _banners.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _banners[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Land your dream job by upskilling now!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.teal,
                            ),
                            child: const Text('Explore Now'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Top Categories - Manually Scrollable
              const Text(
                'Top Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 140, // Fixed width for each category
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              _getCategoryIcon(category['icon']!),
                              size: 40,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category['title']!,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Recommended Courses
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recommended Courses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCourseCard('Introduction to AI', '168K Learners',
                        'FREE', Icons.computer),
                    buildCourseCard('Networking Basics', '120K Learners',
                        '\₹50', Icons.wifi),
                    buildCourseCard('Cyber Security', '98K Learners', '\₹100',
                        Icons.security),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
        ],
      ),
    );
  }

  // Updated to return an icon based on the category
  IconData _getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'bar_chart':
        return Icons.bar_chart;
      case 'code':
        return Icons.code;
      case 'devices':
        return Icons.devices;
      case 'design_services':
        return Icons.design_services;
      case 'build':
        return Icons.build;
      case 'cloud':
        return Icons.cloud;
      case 'security':
        return Icons.security;
      case 'business': // Updated for blockchain category
        return Icons.business; // Using 'business' as placeholder for blockchain
      default:
        return Icons.category;
    }
  }

  // Course card widget
  Widget buildCourseCard(
      String title, String learners, String price, IconData icon) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(learners, style: const TextStyle(fontSize: 12)),
          const Spacer(),
          Text(
            price,
            style: TextStyle(
                color: price == 'FREE' ? Colors.green : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
