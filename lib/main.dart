import 'package:flutter/material.dart';
import 'package:wolly_team/pages/auth_or_app_page.dart';
import 'package:wolly_team/utils/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      home: const AuthOrAppPage(),
    );
  }
}
