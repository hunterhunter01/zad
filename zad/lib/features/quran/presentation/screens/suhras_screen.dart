import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/data_source/models/suhras_model.dart';
import 'package:zad/features/quran/presentation/screens/quran_screen.dart';

import 'package:zad/features/quran/presentation/cubit/suhras_cubit.dart';
import 'package:zad/features/quran/presentation/cubit/suhras_states.dart';
import 'package:zad/features/quran/presentation/widgets/suhras_card.dart';

class SuhrasScreen extends StatelessWidget {
  const SuhrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        toolbarHeight: 50.h,
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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuranScreen(
                            startPage: state.suhrasList[index].startPage,
                            suhraName: state.suhrasList[index].nameArabic,
                            endPage: state.suhrasList[index].resolvedEndPage,
                            suhraNumber: state.suhrasList[index].id,
                            preBasmallah: state.suhrasList[index].preBasmallah,
                          ),
                        ),
                      );
                    },
                    child: SuhraCard(
                      model: state.suhrasList[index]
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
