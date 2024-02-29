import 'package:flutter/material.dart';
import 'package:wolly_team/utils/constants/constant_colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantColors.LOADING_BG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/loading-page-image.png',
                width: 300,
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator(
                color: ConstantColors.blumine,
              ),
              const SizedBox(height: 10),
              const Text(
                'Loading...',
                style: TextStyle(
                  color: ConstantColors.blumine,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ));
  }
}
