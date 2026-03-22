import 'package:first_app/data/core/dio/dio_client.dart';
import 'package:first_app/data/features/auth/providers/auth_provider.dart';
import 'package:first_app/data/features/profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioClient.setUpInterceptors();

  final authProvider = AuthProvider();
  await authProvider.loadAuth();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const MyApp(),
    )
  );
}
