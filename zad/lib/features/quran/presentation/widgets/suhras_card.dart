import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/data_source/models/suhras_model.dart';

class SuhraCard extends StatelessWidget {
  const SuhraCard({super.key,required this.model});


  final SuhrasModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(20.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            alignment: .center,
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Color(0xffEAF3E9),
              borderRadius: .circular(12.r),
              border: Border.all(color: Color(0xffD4E8D4)),
            ),
            child: Text(
              '${model.id}',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: .w600,
                color: Color(0xff1B5E40),
              ),
            ),
          ),
          Spacer(),
          Column(
            spacing: 4.h,
            children: [
              Text(
                'سورة ${model.nameArabic}',
                style: GoogleFonts.amiri(
                  fontSize: 19.sp,
                  fontWeight: .w700,
                  color: Color(0xff1C1917),
                ),
              ),
              Row(
                spacing: 4.w,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    model.ayahLabel,
                    style: GoogleFonts.openSans(
                      fontSize: 12.sp,
                      fontWeight: .w400,
                      color: Color(0xff8A8880),
                    ),
                  ),
                  Text(
                    '${model.versesCount}',
                    style: GoogleFonts.openSans(
                      fontSize: 12.sp,
                      fontWeight: .w400,
                      color: Color(0xff8A8880),
                    ),
                  ),

                  Text(
                    '.',
                    style: GoogleFonts.openSans(
                      fontSize: 12.sp,
                      fontWeight: .w700,
                      color: Color(0xff8A8880),
                    ),
                  ),

                  Text(
                    model.placeArabic,
                    style: GoogleFonts.openSans(
                      fontSize: 12.sp,
                      fontWeight: .w400,
                      color: Color(0xff8A8880),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
