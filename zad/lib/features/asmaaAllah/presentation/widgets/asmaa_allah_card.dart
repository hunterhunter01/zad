import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/asmaaAllah/data_source/model/asmaa_allah_model.dart';

class AsmaaAllahCard extends StatelessWidget {
  const AsmaaAllahCard({super.key, required this.isSelected, required this.model});

  final bool isSelected;
  final AsmaaAllahModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff1B5E40) : Colors.white,
        borderRadius: .circular(32.r),
        border: Border.all(color: Color(0xffE8E3D8), width: 1.w),
      ),
      child: Column(
        spacing: 7.h,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.15)
                  : Color(0xffF3E3FD),

              border: .all(width: 1.w, color: Colors.white.withOpacity(0.35)),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${model.number}',
              style: GoogleFonts.openSans(
                fontSize: 12.sp,
                color: isSelected ? Colors.white : Color(0xff9C27B0),
                fontWeight: .w600,
              ),
            ),
          ),
          Text(
            model.name,
            textAlign: .center,
            style: GoogleFonts.amiri(
              fontSize: 22.sp,
              fontWeight: .w700,
              color: isSelected ? Colors.white : Color(0xff1C1917),
            ),
          ),
          Text(
            model.transliteration,
            style: GoogleFonts.openSans(
              fontSize: 11.sp,
              fontWeight: .w400,
              color: Color(0xff8A8880),
            ),
          ),
          Text(
            isSelected ? model.meaning : '',
            textAlign: .center,
            style: GoogleFonts.openSans(
              fontSize: 10.sp,
              fontWeight: isSelected ? .w600 : .w400,
              color: isSelected ? Colors.grey : Color(0xff8A8880),
            ),
          ),
        ],
      ),
    );
  }
}
