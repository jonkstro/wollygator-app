import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wolly_team/pages/auth_page.dart.dart';
import 'package:wolly_team/pages/loading_page.dart';
import 'package:wolly_team/utils/constants/firebase_constants.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  Future<void> _init() async {
    await dotenv.load(fileName: '.env');
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: FirebaseConstants.firebaseConfig,
      );
    } else {
      await Firebase.initializeApp();
    }
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const AuthPage();
        } else {
          return const LoadingPage();
        }
      },
    );
  }
}
