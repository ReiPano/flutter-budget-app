import 'package:flutter/material.dart';

class DrawerProfileSection extends StatelessWidget {
  const DrawerProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/default_profile_bacground_image.jpg')),
      ),
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey[700],
            child: const Text(
              'AH',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Rei Pano',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
