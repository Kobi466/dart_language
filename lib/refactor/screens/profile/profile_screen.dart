import 'package:flutter/material.dart';

import '../../widgets/avatar/avatar_with_status.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: const [
          SizedBox(height: 40),
          AvatarWithStatus(),
          SizedBox(height: 16),
          Text(
            'Kobi Loi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
