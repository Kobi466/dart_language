import 'package:first_app/data/features/auth/providers/auth_provider.dart';
import 'package:first_app/data/features/auth/ui/login_page.dart';
import 'package:first_app/data/features/profile/provider/profile_provider.dart';
import 'package:first_app/data/features/profile/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final profile = context.watch<ProfileProvider>();
    if (auth.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!auth.isLoggedIn) {
      return LoginPage();
    }
    if (!profile.hasLoaded) {
      if (!profile.isLoading) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<ProfileProvider>().getProfile();
        });
      }
      return const Center(child: CircularProgressIndicator());
    }

    return HomePage();
  }
}
