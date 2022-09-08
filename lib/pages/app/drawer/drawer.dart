import 'package:budget/pages/app/drawer/action_button.dart';
import 'package:budget/pages/app/drawer/profile.dart';
import 'package:flutter/material.dart';

class AppCustomDrawer extends StatelessWidget {
  const AppCustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerProfileSection(),
          ActionButton(
            actionTitle: 'Settings',
            icon: Icons.settings,
          ),
          ActionButton(
            actionTitle: 'Profile',
            icon: Icons.verified_user,
          ),
        ],
      ),
    );
  }
}
