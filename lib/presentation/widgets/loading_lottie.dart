import 'package:appointment_users/core/utils/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        AppLottie.loadingLottie,
        width: width,
        height: height,
      ),
    );
  }
}
