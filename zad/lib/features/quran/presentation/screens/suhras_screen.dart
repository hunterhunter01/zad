import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/presentation/cubit/suhras_cubit.dart';
import 'package:zad/features/quran/presentation/cubit/suhras_states.dart';
import 'package:zad/features/quran/presentation/screens/quran_screen.dart';

class SuhrasScreen extends StatelessWidget {
  const SuhrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Text(
              'القرآن الكريم',
              style: GoogleFonts.amiri(
                fontSize: 24.sp,
                fontWeight: .w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff1B5E40),
      ),
      body: BlocProvider(
        create: (context) => SuhrasCubit()..getSuhras(),
        child: BlocBuilder<SuhrasCubit, SuhrasStates>(
          builder: (context, state) {
            if (state is SuhrasLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is SuhrasFailer) {
              return Text(state.error);
            }
            if (state is SuhrasSuccess) {
              return ListView.separated(
                padding: EdgeInsets.all(20.r),
                itemBuilder: (context, index) {
                  final placeArabic =
                      state.suhrasList[index].revelationPlace == 'makkah'
                      ? 'مكية'
                      : 'مدنية';
                  final ayah = state.suhrasList[index].versesCount <= 10
                      ? 'آيات'
                      : 'آية';

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuranScreen(
                            startPage: state.suhrasList[index].startPage, suhraName: state.suhrasList[index].nameArabic, revelationPlace: placeArabic, ayahsCount: state.suhrasList[index].versesCount, endPage: state.suhrasList[index].endPage, suhraNumber: state.suhrasList[index].id,
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                              '${state.suhrasList[index].id}',
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
                                'سورة ${state.suhrasList[index].nameArabic}',
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
                                    ayah,
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: .w400,
                                      color: Color(0xff8A8880),
                                    ),
                                  ),
                                  Text(
                                    '${state.suhrasList[index].versesCount}',
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
                                    placeArabic,
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
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: state.suhrasList.length,
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
