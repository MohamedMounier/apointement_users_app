import 'package:appointment_users/core/utils/responsive/responsive_layout.dart';
import 'package:appointment_users/presentation/screens/home/home_mobile.dart';
import 'package:appointment_users/presentation/screens/home/home_tablet.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
   if(ResponsiveLayout.isMobile(context)){
      return const HomeMobileScreen();
    }else{
      return const HomeTabletScreen();
    }
  }
}
