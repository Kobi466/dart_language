import 'package:first_app/data/models/profile_model.dart';
import 'package:first_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  final ProfileModel profileModel;
  const HomePage({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              auth.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("${profileModel.avatar}"),
                radius: 50,
              ),
              Text(
                "Xin chào ${profileModel.fullName}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 12,),

              _info('About', profileModel.about),
              _info('Full Name', profileModel.fullName),
              _info('Github', profileModel.github),
              _info('Linkedin', profileModel.linkedin),
              _info('Facebook', profileModel.facebook),
              _info('Youtube', profileModel.youtube),
              _info('Personal Website', profileModel.personalWebsite)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _info(String label, String? value) {
  return Padding(
    padding: EdgeInsetsGeometry.only(bottom: 8),
    child: Text(
      '$label: ${value ?? "Chưa cập nhật"}',
      style: TextStyle(
        fontSize: 16
      ),
    ),
  );
}