import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/quran/persintaion/cubit/suhras_cubit.dart';
import 'package:zad/features/quran/persintaion/cubit/suhras_states.dart';

class SuhrasScreen extends StatelessWidget {
  const SuhrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'القرآن الكريم',
              style: GoogleFonts.amiri(
                fontSize: 24,
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
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  final placeArabic =
                      state.suhrasList[index].revelationPlace == 'makkah'
                      ? 'مكية'
                      : 'مدنية';
                  final ayah = state.suhrasList[index].versesCount <= 10
                      ? 'آيات'
                      : 'آية';

                  return Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: .center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffEAF3E9),
                            borderRadius: .circular(12),
                            border: Border.all(color: Color(0xffD4E8D4)),
                          ),
                          child: Text(
                            '${state.suhrasList[index].id}',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: .w600,
                              color: Color(0xff1B5E40),
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          spacing: 4,
                          children: [
                            Text(
                              'سورة ${state.suhrasList[index].nameArabic}',
                              style: GoogleFonts.amiri(
                                fontSize: 19,
                                fontWeight: .w700,
                                color: Color(0xff1C1917),
                              ),
                            ),
                            Row(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  ayah,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: .w400,
                                    color: Color(0xff8A8880),
                                  ),
                                ),
                                Text(
                                  '${state.suhrasList[index].versesCount}',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: .w400,
                                    color: Color(0xff8A8880),
                                  ),
                                ),

                                Text(
                                  '.',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: .w700,
                                    color: Color(0xff8A8880),
                                  ),
                                ),

                                Text(
                                  placeArabic,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
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
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: state.suhrasList.length,
              );
            }
            return Text('data');
          },
        ),
      ),
    );
  }
}
