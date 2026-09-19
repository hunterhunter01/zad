import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';
import 'package:zad/features/asmaaAllah/persentaion/cubit/asmaa_allah_cubit.dart';
import 'package:zad/features/asmaaAllah/persentaion/cubit/asmaa_allah_states.dart';

class AsmaaAllahScreen extends StatefulWidget {
  AsmaaAllahScreen({super.key});

  @override
  State<AsmaaAllahScreen> createState() => _AsmaaAllahScreenState();
}

class _AsmaaAllahScreenState extends State<AsmaaAllahScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'أسماء الله الحسنى',
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
        create: (context) => AsmaaAllahCubit()..getNames(),
        child: BlocBuilder<AsmaaAllahCubit, AsmaaAllahStates>(
          builder: (context, state) {
            if (state is AsmaaAllahLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is AsmaaAllahFailer) {
              return Text(state.error);
            }
            if (state is AsmaaAllahSuccess) {
              return GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1,
                ),
                itemCount: state.namesList.length,
                itemBuilder: (context, index) {
                  final bool isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = isSelected ? -1 : index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xff1B5E40) : Colors.white,
                        borderRadius: .circular(32),
                        border: Border.all(color: Color(0xffE8E3D8), width: 1),
                      ),
                      child: Column(
                        spacing: 7,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isSelected?Colors.white.withOpacity(0.15): Color(0xffF3E3FD),
                              
                              border: .all(width: 1,color: Colors.white.withOpacity(0.35)),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${state.namesList[index].number}',
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color:isSelected?Colors.white: Color(0xff9C27B0),
                                fontWeight: .w600,
                              ),
                            ),
                          ),
                          Text(
                            state.namesList[index].name,
                            style: GoogleFonts.amiri(
                              fontSize: 22,
                              fontWeight: .w700,
                              color:isSelected?Colors.white: Color(0xff1C1917),
                            ),
                          ),
                          Text(
                            state.namesList[index].transliteration,
                            style: GoogleFonts.openSans(
                              fontSize: 11,
                              fontWeight: .w400,
                              color: Color(0xff8A8880),
                            ),
                          ),
                          Text(
                            isSelected? state.namesList[index].meaning: '',
                            style: GoogleFonts.openSans(
                              fontSize: 10,
                              fontWeight: isSelected? .w600 : .w400,
                              color:isSelected? Colors.grey: Color(0xff8A8880),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
