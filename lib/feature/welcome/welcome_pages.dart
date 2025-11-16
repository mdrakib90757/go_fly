import 'package:flutter/material.dart';
import 'package:go_fly/core/shared_widget/custom_button.dart';
import 'package:go_fly/core/utils/color.dart';
import 'package:lottie/lottie.dart';
import '../../core/shared_widget/custom_nevbar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: Column(
        children: [
          // Top blue container with plane image
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset("assets/animation/loading.json", height: 250),
                  // Image.asset(
                  //   'assets/image/plane.png',
                  //   height: 100,
                  // ),
                ],
              ),
            ),
          ),
          // Bottom white container with text and button
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Explore Exciting Destination',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  ),

                  Lottie.asset(
                    'assets/animation/girl travel walk cycle.json',
                    height: 200,
                  ),
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomBottomNavBar(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
