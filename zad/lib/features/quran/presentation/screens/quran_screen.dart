import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zad/features/quran/presentation/cubit/quran_states.dart';

class QuranScreen extends StatelessWidget {
  final int startPage;
  final int endPage;
  final String suhraName;
  final int suhraNumber;
  final bool preBasmallah;

  const QuranScreen({
    super.key,
    required this.startPage,
    required this.endPage,
    required this.suhraName,
    required this.suhraNumber, required this.preBasmallah,
  });


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => QuranCubit()..getPage(startPage),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xffFAF8F3),
            appBar: AppBar(
              backgroundColor: const Color(0xff1B5E40),
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                'سورة $suhraName',
                style: GoogleFonts.amiri(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              actions: [
                BlocBuilder<QuranCubit, QuranStates>(
                  builder: (context, state) {
                    if (state is QuranSuccess && state.ayahs.isNotEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Center(
                          child: Text(
                            'جزء ${state.ayahs.first.juz} - حزب ${state.ayahs.first.hizb}',
                            style: GoogleFonts.amiri(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
            body: PageView.builder(
              reverse: true,
              itemCount: endPage - startPage + 1,
              onPageChanged: (index) {
                context.read<QuranCubit>().getPage(startPage + index);
              },
              itemBuilder: (context, index) {
                return BlocBuilder<QuranCubit, QuranStates>(
                  builder: (context, state) {
                    if (state is QuranLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff1B5E40),
                        ),
                      );
                    }

                    if (state is QuranIFailer) {
                      return Text(
                        state.error,
                      );
                    }

                    if (state is QuranSuccess) {
                      
                      if (state.currentPage != startPage + index) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff1B5E40),
                          ),
                        );
                      }

                      final surahAyahs = state.ayahs
                          .where((ayah) => ayah.chapterId == suhraNumber)
                          .toList();

                      if (surahAyahs.isEmpty) {
                        return Center(
                          child: Text(
                            'لا توجد آيات لهذه السورة في هذه الصفحة',
                            style: GoogleFonts.amiri(
                              fontSize: 16.sp,
                              color: const Color(0xff8A8880),
                            ),
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          children: [
                            Text(
                              preBasmallah == true &&
                                      state.currentPage == startPage
                                  ? ' بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ'
                                  : '',
                              style: GoogleFonts.amiri(
                                fontSize: 22.sp,
                                height: 2.2.h,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff1C1917),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: const Color(0xffE2DDD0),
                                ),
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
                                        final ayahNumber = ayah.verseKey
                                            .split(':')
                                            .last;

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
                                    'صفحة ${state.currentPage}',
                                    style: GoogleFonts.amiri(
                                      fontSize: 14.sp,
                                      color: const Color(0xff8A8880),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
