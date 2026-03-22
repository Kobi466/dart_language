import 'dart:io';

import 'package:first_app/data/features/profile/data/profile_request.dart';
import 'package:first_app/data/features/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';  

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _aboutController = TextEditingController();
  final _personalWebsiteController = TextEditingController();
  final _githubController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _facebookController = TextEditingController();
  final _youtubeController = TextEditingController();

  File? avatarFile;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileProvider>().profile;
    if (profile != null) {
      _fullNameController.text = profile.fullName;
      _aboutController.text = profile.about ?? '';
      _personalWebsiteController.text = profile.personalWebsite ?? '';
      _githubController.text = profile.github ?? '';
      _linkedinController.text = profile.linkedin ?? '';
      _facebookController.text = profile.facebook ?? '';
      _youtubeController.text = profile.youtube ?? '';
    }
  }

  Future<void> pickAvatar() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      await context.read<ProfileProvider>().uploadAvatar(file: File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextFormField(
              controller: _aboutController,
              decoration: InputDecoration(labelText: "About"),
            ),
            TextFormField(
              controller: _personalWebsiteController,
              decoration: InputDecoration(labelText: "Personal Website"),
            ),
            TextFormField(
              controller: _githubController,
              decoration: InputDecoration(labelText: "Github"),
            ),
            TextFormField(
              controller: _linkedinController,
              decoration: InputDecoration(labelText: "Linkedin"),
            ),
            TextFormField(
              controller: _facebookController,
              decoration: InputDecoration(labelText: "Facebook"),
            ),
            TextFormField(
              controller: _youtubeController,
              decoration: InputDecoration(labelText: "Youtube"),
            ),
            ElevatedButton(
              onPressed: pickAvatar,
              child: Text("Pick Avatar"),
            ),
            
            if (profile.isLoading)
              CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await context.read<ProfileProvider>().updateProfile(
                    request: UpdateProfileRequest(
                      fullName: _fullNameController.text,
                      about: _aboutController.text,
                      personalWebsite: _personalWebsiteController.text,
                      github: _githubController.text,
                      linkedin: _linkedinController.text,
                      facebook: _facebookController.text,
                      youtube: _youtubeController.text,
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: Text("Update Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
