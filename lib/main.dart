import 'package:first_app/data/api/dio_client.dart';
import 'package:first_app/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioClient.setUpInterceptors();

  final authProvider = AuthProvider();
  await authProvider.loadAuth();

  runApp(
    ChangeNotifierProvider<AuthProvider>.value(
      value: authProvider,
      child: const MyApp(),
    ),
  );
}
