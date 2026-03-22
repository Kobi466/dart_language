import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/data/features/auth/providers/auth_provider.dart';
import 'package:first_app/data/features/profile/provider/profile_provider.dart';
import 'package:first_app/data/features/profile/ui/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();
    if (profile.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (profile.profile == null) {
      return Column(
        children: [
          const Center(
            child: Text(
              "No profile found",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProfileProvider>().getProfile();
            },
            child: Text("Load Profile"),
          ),
          ElevatedButton(
            onPressed: () => context.read<AuthProvider>().logout(),
            child: Text("Logout"),
          ),
        ],
      );
    }
    final profileModel = profile.profile!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<AuthProvider>().logout();
              // ignore: use_build_context_synchronously
              context.read<ProfileProvider>().clear();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (profileModel.avatar != null)
            CachedNetworkImage(
              imageUrl: profileModel.avatar!,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 50,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person),
                  ),
            ),

            const SizedBox(height: 16),
            Text(
              "Xin chào ${profileModel.fullName}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _info('About', profileModel.about),
            _info('Full Name', profileModel.fullName),
            _info('Github', profileModel.github),
            _info('Linkedin', profileModel.linkedin),
            _info('Facebook', profileModel.facebook),
            _info('Youtube', profileModel.youtube),
            _info('Personal Website', profileModel.personalWebsite),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
              child: Text("Edit Profile"),
            ),
          ],
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
      style: TextStyle(fontSize: 16),
    ),
  );
}

Widget buildAvatar(String url) {
  return ClipOval(
    child: Image.network(
      url,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SizedBox(
          width: 100,
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          width: 100,
          height: 100,
          child: Icon(Icons.person, size: 50),
        );
      },
    ),
  );
}
