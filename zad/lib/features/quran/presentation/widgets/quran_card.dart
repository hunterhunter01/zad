import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/data_source/models/quran_model.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({super.key, required this.surahAyahs, required this.currentPage});

  final List<QuranModel> surahAyahs;
  final int currentPage;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE2DDD0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: surahAyahs.map((ayah) {
                final ayahNumber = ayah.verseKey.split(':').last;

                return TextSpan(
                  children: [
                    TextSpan(
                      text: '${ayah.text} ',
                      style: GoogleFonts.amiri(
                        fontSize: 22.sp,
                        height: 2.2,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1C1917),
                      ),
                    ),
                    TextSpan(
                      text: '\u06DD$ayahNumber ',
                      style: GoogleFonts.amiri(
                        fontSize: 20.sp,
                        color: const Color(0xff1B5E40),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 20.h),
          Text(
            'صفحة ${currentPage}',
            style: GoogleFonts.amiri(
              fontSize: 14.sp,
              color: const Color(0xff8A8880),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
