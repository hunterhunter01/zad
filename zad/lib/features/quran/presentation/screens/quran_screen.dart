import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/data_source/models/quran_model.dart';
import 'package:zad/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zad/features/quran/presentation/cubit/quran_states.dart';
import 'package:zad/features/quran/presentation/widgets/quran_card.dart';

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
            backgroundColor:  Color(0xffFAF8F3),
            appBar: AppBar(
              backgroundColor:  Color(0xff1B5E40),
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
                                height: 2.2,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff1C1917),
                              ),
                            ),
                            QuranCard(surahAyahs: surahAyahs, currentPage: state.currentPage,),
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

