import 'package:flutter/material.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_cubit.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/azkar_categories_screen.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/dua_categories_screen.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/zikr_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zad/features/home/persentaion/screens/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      

      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
