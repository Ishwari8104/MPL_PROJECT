import 'dart:math';

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furnitureapp/model/category_model.dart';
import 'package:furnitureapp/screens/cart_screen.dart';
import 'package:furnitureapp/screens/product_screen.dart';
import 'package:furnitureapp/screens/profile_page.dart';
import 'package:furnitureapp/screens/quiz_page.dart';
import 'package:furnitureapp/screens/users_page.dart';
import 'package:furnitureapp/widgets/grid_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> categories = ["All", "Chairs", "Sofas", "Tables", "Beds"];
  int activeIndex = 2;
  List<Map<String, dynamic>> navItems = [
    {'icon': Icons.location_city_rounded, 'color': Colors.black54},
    {'icon': Icons.compass_calibration, 'color': Colors.black54},
    {'icon': Icons.bookmark, 'color': Colors.black54},
    {'icon': Icons.mail, 'color': Colors.black54},
    {'icon': Icons.person, 'color': Colors.black54},
  ];

  Widget getCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index ? Colors.indigo : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            )),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                // Custom App Bar
                // Custom App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 4,
                              offset: Offset(0.6, 0.7),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.menu),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 4,
                              offset: Offset(0.6, 0.7),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.quiz),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Sign-out icon
                    GestureDetector(
                      onTap: () {
                        widget.logout();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 4,
                              offset: Offset(0.6, 0.7),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.logout),
                      ),
                    ),
                    
                  ],
                ),

                SizedBox(height: 30),
                // Categories List View
                Container(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories.asMap().entries.map(
                          (MapEntry map) => getCategories(map.key),
                    ).toList(),
                  ),
                ),
                SizedBox(height: 20),
                // Items grid view
                StaggeredGrid.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: categoriesGrid.asMap().entries.map((MapEntry map) {
                    int index = map.key;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(categoriesGrid[index]),
                          ),
                        );
                      },
                      child: GridItems(index),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        onTap: (index) {
          if (index == 0) {
            // If the selected index is the first one (location_city_rounded icon), navigate to the UsersPage
            // Replace 'UsersPage' with your actual users page class
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersPage()),
            );
          } else if (index == navItems.length - 1) {
            // If the selected index is the last one (person icon), navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else {
            // Toggle between icons for other indices
            setState(() {
              activeIndex = index;
            });
          }
        },
        height: 60,
        circleWidth: 60,
        activeIndex: activeIndex,
        circleColor: Colors.indigo,
        color: Colors.white,
        activeIcons: List.generate(
          navItems.length,
          (index) => Icon(
            navItems[index]['icon'],
            color: Colors.white,
          ),
        ),
        inactiveIcons: List.generate(
          navItems.length,
          (index) => Icon(
            navItems[index]['icon'],
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
