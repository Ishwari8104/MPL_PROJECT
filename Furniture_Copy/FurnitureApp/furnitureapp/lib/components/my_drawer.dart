import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.favorite,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
            ),

            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("H O M E"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),


            //profile tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("P R O F I L E"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            //users tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("U S E R S"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
