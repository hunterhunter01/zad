import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/data_source/models/azkar_categories_model.dart';

class AzkarAndDuaCategoryCard extends StatelessWidget {
  const AzkarAndDuaCategoryCard({super.key, required this.category});

  final AzkarCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(32.r),
        border: Border.all(color: Color(0xffE8E3D8), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: .center,
        spacing: 7.h,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Color(0xffF3E3FD),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${category.count}',
              style: GoogleFonts.openSans(
                fontSize: 12.sp,
                color: Color(0xff9C27B0),
                fontWeight: .w600,
              ),
            ),
          ),
          Text(
            textAlign: .center,
            category.title,
            style: GoogleFonts.amiri(
              fontSize: 22.sp,
              fontWeight: .w700,
              color: Color(0xff1C1917),
            ),
          ),
          Text(
            textAlign: .center,
            category.translate,

            style: GoogleFonts.openSans(
              fontSize: 11.sp,
              fontWeight: .w400,
              color: Color(0xff8A8880),
            ),
          ),
        ],
      ),
    );
  }
}
