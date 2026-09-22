import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/azkar_categories_screen.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/dua_categories_screen.dart';
import 'package:zad/features/asmaaAllah/presentation/screens/asmaa_allah_screen.dart';
import 'package:zad/features/home/persentaion/widgets/category_card.dart';
import 'package:zad/features/quran/presentation/screens/suhras_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> list = [
    {'title': 'الأدعية','en':'Du\'aa','number':'81', 'screen': DuaCategoriesScreen()},
    {'title': 'الأذكار','en':'Azkar','number':'51', 'screen': AzkarCategoriesScreen()},
    {'title': 'أسماء الله الحسنى','en':'Asmaa Allah Al-Husna','number':'99', 'screen': AsmaaAllahScreen()},
    {'title': 'القرآن الكريم','en':'Quran','number':'114', 'screen': SuhrasScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        backgroundColor: Color(0xff1B5E40),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'زاد',
              style: GoogleFonts.amiri(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              'zad',
              style: GoogleFonts.openSans(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.65),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Row(children: []),
            Align(
              alignment: .topRight,
              child: Text(
                'الأقسام',
                style: GoogleFonts.amiri(
                  color: Color(0xff1C1917),
                  fontSize: 15.sp,
                  fontWeight: .w700,
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 1.3,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => list[index]['screen'],
                        ),
                      );
                    },

                    child: CategoryCard( number: list[index]['number'], en: list[index]['en'], title: list[index]['title'],),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

