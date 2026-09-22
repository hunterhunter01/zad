import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.number, required this.en, required this.title});

  final String number;
  final String en;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(20.r),
        border: Border.all(color: Color(0xffE8E3D8), width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: .end,
        children: [
          Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: Color(0xffFAF7F2),
              shape: BoxShape.circle,
              border: BoxBorder.all(color: Color(0xffE8E3D8), width: 1.w),
            ),
            child: Text(
              number,

              style: GoogleFonts.openSans(
                color: Color(0xff1C1917),
                fontSize: 9.sp,
                fontWeight: .w400,
              ),
            ),
          ),
          Spacer(),
          Text(
            title,
            textAlign: .right,
            style: GoogleFonts.amiri(
              color: Color(0xff1C1917),
              fontSize: 15.sp,
              fontWeight: .w700,
            ),
          ),
          Text(
            en,
            textAlign: .right,
            style: GoogleFonts.openSans(
              color: Color(0xff1C1917),
              fontSize: 10.sp,
              fontWeight: .w400,
            ),
          ),
        ],
      ),
    );
  }
}
