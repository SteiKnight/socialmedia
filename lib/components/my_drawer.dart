import 'package:flutter/material.dart';
import 'package:socialmedia/components/drawer_tile.dart';
import 'package:socialmedia/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut() {
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //drawer items
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header
              DrawerHeader(
                child: Icon(Icons.favorite),
              ),

              SizedBox(height: 25),
              //Home
              DrawerTile(
                icon: Icons.home,
                title: "H O M E",
                onTap: () => Navigator.pop(context),
              ),

              // Profile
              DrawerTile(
                icon: Icons.person,
                title: "P R O F I L E",
                onTap: () => Navigator.pushNamed(context, '/profile_page'),
              ),

              // Users
              DrawerTile(
                icon: Icons.people,
                title: "U S E R S",
                onTap: () => Navigator.pushNamed(context, '/users_page'),
              ),

              // Settings
              DrawerTile(
                icon: Icons.settings,
                title: "S E T T I N G S",
                onTap: () => Navigator.pushNamed(context, '/settings_page'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: DrawerTile(
              onTap: signOut,
              icon: Icons.logout,
              title: "L O G O U T",
            ),
          ),
        ],
      ),
    );
  }
}
