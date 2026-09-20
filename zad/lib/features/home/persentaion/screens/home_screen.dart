import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/azkar_categories_screen.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/dua_categories_screen.dart';
import 'package:zad/features/asmaaAllah/presentation/screens/asmaa_allah_screen.dart';
import 'package:zad/features/quran/presentation/screens/suhras_screen.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

   final List<Map<String, dynamic>> list = [
    {'title': 'الأدعية', 'screen': DuaCategoriesScreen()},
    {'title': 'الأذكار', 'screen': AzkarCategoriesScreen()},
    {'title': 'أسماء الله الحسنى', 'screen': AsmaaAllahScreen()},
    {'title': 'القرآن', 'screen': SuhrasScreen()},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(20.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 1.3,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              borderRadius: .circular(32.r),
              border: Border.all(color: Color(0xffE8E3D8), width: 1.w),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => list[index]['screen'],
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: .end,
                children: [
                  Text(
                    list[index]['title'],
                    textAlign: .right,
                    style: GoogleFonts.openSans(
                      color: Color(0xff1C1917),
                      fontSize: 20.sp,
                      fontWeight: .w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
