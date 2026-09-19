import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_cubit.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/zikr_screen.dart';

class DuaCategoriesScreen extends StatelessWidget {
  const DuaCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              ' الأدعية',
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
        create: (context) => AzkarCategoriesCubit()..getcategories(),
        child: BlocBuilder<AzkarCategoriesCubit, AzkarCategoriesState>(
          builder: (context, state) {
            if (state is AzkarCategoriesLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is AzkarCategoriesFailer) {
              return Text(state.error);
            }
            if (state is AzkarCategoriesSuccess) {
              final duaList = state.categories.where((c) => c.title.contains('دعاء')).toList();
              
              return GridView.builder(
                padding: EdgeInsets.all(15),
                itemCount: duaList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                   childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ZikrScreen(
                            category: duaList[index].number,
                            title: duaList[index].title,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(32),
                        border: Border.all(color: Color(0xffE8E3D8), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: .center,
                        spacing: 7,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xffF3E3FD),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${duaList[index].count}',
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: Color(0xff9C27B0),
                                fontWeight: .w600,
                              ),
                            ),
                          ),
                          Text(
                            textAlign: .center,
                            duaList[index].title,
                            style: GoogleFonts.amiri(
                              fontSize: 22,
                              fontWeight: .w700,
                              color: Color(0xff1C1917),
                            ),
                          ),
                          Text(
                            textAlign: .center,
                            duaList[index].translate,
                            style: GoogleFonts.openSans(
                              fontSize: 11,
                              fontWeight: .w400,
                              color: Color(0xff8A8880),
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
