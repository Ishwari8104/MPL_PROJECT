import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance.collection("Users").doc(currentUser!.email).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Error
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          // Data received
          else if (snapshot.hasData) {
            // Extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      "Email",
                      style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user!['email']),
                  ),
                  ListTile(
                    title: Text(
                      "Full Name",
                      style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user!['fullName']),
                  ),
                  ListTile(
                    title: Text(
                      "Phone",
                      style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user!['phone']),
                  ),
                ],
              ),
            );
          } else {
            return Text("No Data");
          }
        },
      ),
    );
  }
}
