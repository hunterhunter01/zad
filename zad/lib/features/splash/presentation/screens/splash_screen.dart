import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zad/features/home/persentaion/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer( Duration(seconds: 3), () {
     
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    );
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:  Color(0xffFAF8F3),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/images/logo.png',
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 24.h),

            Text(
              'زاد',
              style: GoogleFonts.amiri(
                fontSize: 80.sp,
                fontWeight: FontWeight.bold,
                color:  Color(0xff0D4A38),
                height: 1.1,
              ),
            ),
            SizedBox(height: 16.h),
        
            Text(
              'القرآن  •  الأذكار  •  الأدعية',
              style: GoogleFonts.amiri(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color:  Color(0xff6C757D),
              ),
            ), SizedBox(height: 100.h,),
            LoadingAnimationWidget.progressiveDots(color:  Color(0xff0D4A38),size: 40.r,)
            
          ],
          
        ),
      ),
    );
  }
}