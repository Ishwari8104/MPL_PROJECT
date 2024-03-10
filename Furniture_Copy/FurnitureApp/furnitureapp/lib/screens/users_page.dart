import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // Handle errors
          if (snapshot.hasError) {
            displayMessageToUser("Something went wrong", context);
          }

          // Show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // No data available
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Data"),
            );
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                title: Text(
                  user['fullName'],
                  style: TextStyle(color: Colors.indigo),
                ),
                subtitle: Text(user['email']),
              );
            },
          );
        },
      ),
    );
  }
}
